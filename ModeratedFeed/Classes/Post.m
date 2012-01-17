#import "Post.h"
#import "AFNetworking.h"
#import "MWFeedParser.h"
#import "FeedParserDelegate.h"
#import "NSString+MD5.h"
#import "NSString+Strip.h"
#import "Author.h"
#import "Tag.h"
#import "Signature.h"
#import "NSString+HTML.h"


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
    NSString * stringToHash = [[NSString stringWithFormat: @"%@%@%@", item.title,  item.sourceLink, item.summary] fullStrippedString]; 
    NSString * hashString = [stringToHash MD5String];
    Post* post = [self findFirstByAttribute:@"hashString" withValue:hashString];
    if (!post) {
        post = [self createEntity];

        post.hashString = hashString;
    }
    
    
    Tag* tag;
    for (NSString* tagName in item.categories) {
        tag = [Tag findFirstByAttribute:@"nameLowerCase" withValue:[tagName lowercaseString]];
        if (tag) {
            NSLog(@"%@ %@", tag, tagName);
            [post addTagsObject:tag];
        }
    }
    
    
    Signature *signature = [Signature findFirstByAttribute:@"hashString" withValue:hashString];
    if (signature) {
        post.signature = signature;
    }
    
    Author *author = [Author findFirstByAttribute:@"url" withValue:item.sourceLink];
    if (!author) {
        author = [Author createEntity];
        author.url = item.sourceLink;
    }
    [post setAuthor:author];
    
    
    
    post.content = item.summary;
    post.title = [item.title stringByConvertingHTMLToPlainText];
    post.url = item.link;
    return post;
    
}

@end
