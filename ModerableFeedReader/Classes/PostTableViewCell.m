//
//  PostTableViewCell.m
//  ModerableFeedReader
//
//  Created by Sergey Klimov on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PostTableViewCell.h"
#import "Post.h"
@implementation PostTableViewCell


@synthesize label;

- (void)configureWithObject:(Post *)post {
	
	
	self.label.text = post.title;
}

@end
