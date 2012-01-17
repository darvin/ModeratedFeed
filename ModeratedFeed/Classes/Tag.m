#import "Tag.h"
#import "AFNetworking.h"
@implementation Tag


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
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[url URLByAppendingPathComponent: @"tags"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSMutableArray* tags = [NSMutableArray arrayWithCapacity:[JSON count]];

        Tag* tag;
        for (NSString* tagName in JSON) {
            tag = [self findFirstByAttribute:@"name" withValue:tagName];
            if (!tag) {
                tag = [self createEntity];
                tag.name = tagName;
                
            }
            [tags addObject:tag];
        }
        
        if(success)
            success(tags);
    } failure:nil];
    
    [[self queue] addOperation:operation];
}
- (NSString *) nameLowerCase {
    return [self.name lowercaseString];
}
@end
