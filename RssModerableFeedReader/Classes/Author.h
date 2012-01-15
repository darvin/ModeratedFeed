#import "_Author.h"
#import "MWFeedItem.h"
@interface Author : _Author {}
+ (id) createEntityWithFeedItem:(MWFeedItem*) item;
@end
