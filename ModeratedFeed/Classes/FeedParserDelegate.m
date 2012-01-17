    //
//  FeedParserDelegate.m
//  TVFansMagazine
//
//  Created by Sergey Klimov on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedParserDelegate.h"
#import "Post.h"
@implementation FeedParserDelegate
- (void)feedParserDidStart:(MWFeedParser *)parser {
    
}
- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info {
    
}
- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
    [Post createEntityWithFeedItem:item];
}
- (void)feedParserDidFinish:(MWFeedParser *)parser {
    
}
- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error{
    
}
@end
