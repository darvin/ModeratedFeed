#import "Author.h"
#import "MWFeedItem.h"
@implementation Author

+ (id) createEntityWithFeedItem:(MWFeedItem*) item {
    Author *author = [self findFirstByAttribute:@"url" withValue:item.sourceLink];
    if (!author) {
        author = [self createEntity];
        author.url = item.sourceLink;
    }
    author.name = item.author;
    author.title = item.sourceTitle;
    return author;
}
@end
