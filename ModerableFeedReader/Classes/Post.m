#import "Post.h"
#import "AFNetworking.h"
#import "MWFeedParser.h"
#import "FeedParserDelegate.h"
#import "NSString+MD5.h"
#import "NSString+Strip.h"
#import "Author.h"
#import "Tag.h"
#import "Signature.h"


@interface Post() {
    
}
+ (void) fetchFromFeed:(NSURL *)url;
@end


@implementation Post

+ (NSOperationQueue*) queue {
    static NSOperationQueue *queue;
    
    @synchronized(self)
    {
        if (!queue)
            queue = [[NSOperationQueue alloc] init];
        
        return queue;
    }
}
+ (void) fetchFromUrl:(NSURL*)url {
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[url URLByAppendingPathComponent: @"info"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        [self fetchFromFeed:[NSURL URLWithString:[JSON valueForKey:@"feedUrl"]]];
        
    } failure:nil];
    
    [[self queue] addOperation:operation];
}

+ (void) fetchFromFeed:(NSURL*)url {
    
    MWFeedParser * feedParser = [[MWFeedParser alloc] initWithFeedURL:url];
    FeedParserDelegate *parserDelegate = [[FeedParserDelegate alloc] init];
    feedParser.delegate = parserDelegate;
    feedParser.feedParseType = ParseTypeFull;
    [feedParser parse];
}

+ (id) createEntityWithFeedItem:(MWFeedItem*) item {
    NSLog(@"------%@", [NSManagedObjectContext defaultContext]);

    NSString * stringToHash = [[NSString stringWithFormat: @"%@%@%@", item.title,  item.sourceLink, item.summary] fullStrippedString]; 
    NSString * hashString = [stringToHash MD5String];
    Post* post = [self findFirstByAttribute:@"hashString" withValue:hashString];
    if (!post) {
        post = [self createEntity];

        post.hashString = hashString;
    }
    post.content = item.summary;
    post.title = item.title;
    post.url = item.link;
    
    
    Tag* tag;
    for (NSString* tagName in item.categories) {
        tag = [Tag findFirstByAttribute:@"name" withValue:tagName];
        if (tag) {
            [post addTagsObject:tag];
        }
    }
    
    
    Signature *signature = [Signature findFirstByAttribute:@"hashString" withValue:hashString];
    if (signature) {
        post.signature = signature;
    }
    
    Author *author = [Author createEntityWithFeedItem:item];
    post.author = author;
    
    return post;
    
}

@end
