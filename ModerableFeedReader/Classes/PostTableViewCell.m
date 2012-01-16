//
//  PostTableViewCell.m
//  ModerableFeedReader
//
//  Created by Sergey Klimov on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PostTableViewCell.h"
#import "Post.h"
#import "Author.h"
#import "UIImageView+WebCache.h"
@implementation PostTableViewCell


@synthesize title, authorName, authorPicture;

- (void)configureWithObject:(Post *)post {
	
	
	self.title.text = post.title;
    self.authorName.text = post.author.name;
    if (post.author.imageURL)
        [self.authorPicture setImageWithURL:[NSURL URLWithString:post.author.imageURL]];
}

@end
