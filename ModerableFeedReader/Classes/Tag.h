#import "_Tag.h"

@interface Tag : _Tag {}
+ (NSOperationQueue*) queue;
+ (void) fetchFromUrl:(NSURL*)url;
@end
