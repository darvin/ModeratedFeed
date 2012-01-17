#import "_Tag.h"

@interface Tag : _Tag {}
+ (NSOperationQueue*) queue;
+ (void) fetchFromUrl:(NSURL*)url success:(void (^)(NSArray *fetchedEntitles))success;
@end
