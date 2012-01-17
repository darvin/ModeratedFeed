#import "Signature.h"
#import "AFNetworking.h"
#import "Post.h"

@implementation Signature
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
    //TODO: Fetch only new signatures
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[url URLByAppendingPathComponent: @"signatures"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        Signature* signature;
        for (NSString* hashString in JSON) {
            signature = [self findFirstByAttribute:@"hashString" withValue:hashString];
            if (!signature) {
                signature = [self createEntity];
                signature.hashString = hashString;
            }
            signature.timestamp = [NSNumber numberWithInt: [[JSON valueForKey:hashString] intValue]];
            Post* post = [Post findFirstByAttribute:@"hashString" withValue:hashString];
            signature.post = post;
        }
    } failure:nil];
    
    [[self queue] addOperation:operation];
    
}
@end
