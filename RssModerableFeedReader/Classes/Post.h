#import "_Post.h"
#import "MWFeedItem.h"
@interface Post : _Post {}
+ (NSOperationQueue*) queue;
+ (void) fetchFromUrl:(NSURL*)url;
+ (id) createEntityWithFeedItem:(MWFeedItem*) item;
@end
