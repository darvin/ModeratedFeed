#import "_Author.h"
#import "MWFeedItem.h"
#import "Post.h"

@interface Author : _Author {}

+ (NSOperationQueue*) queue;
+ (void) fetchFromUrl:(NSURL*)url success:(void (^)(NSArray *fetchedEntitles))success ;
@end
