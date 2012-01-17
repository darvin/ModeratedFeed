#import "Author.h"
#import "MWFeedItem.h"
#import "Post.h"
#import "AFNetworking.h"
#import "NSString+XMLEntities.h"

@implementation Author





+ (NSOperationQueue*) queue {
    static NSOperationQueue *queue;
    
    @synchronized(self)
    {
        if (!queue)
            queue = [[NSOperationQueue alloc] init];
        
        return queue;
    }
}
+ (void) fetchFromUrl:(NSURL*)url success:(void (^)(NSArray *fetchedEntitles))success {
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[url URLByAppendingPathComponent: @"authors"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        Author* author;
        NSMutableArray* authors = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSString* url in JSON) {
            author = [self findFirstByAttribute:@"url" withValue:url];
            if (!author) {
                author = [self createEntity];
                author.url = url;
                
            }
            NSDictionary *authorData = [JSON objectForKey:url];
            author.name = [authorData objectForKey:@"name"];
            author.title = [[authorData objectForKey:@"title"] stringByDecodingXMLEntities];
            NSString* imageURL = [authorData objectForKey:@"image_url"];
            if (imageURL!=(id)[NSNull null]) {
                author.imageURL = imageURL;
            }
            NSString* subtitle = [authorData objectForKey:@"subtitle"];
            if (subtitle!=(id)[NSNull null]) {
                author.subtitle = subtitle;
            }

            [authors addObject:author];

        }
        if(success)
            success(authors);
    } failure:nil];
    
    [[self queue] addOperation:operation];
}
@end
