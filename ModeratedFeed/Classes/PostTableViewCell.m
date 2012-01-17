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
-(void) layoutSubviews {
    CGSize maximumSize = CGSizeMake(self.title.frame.size.width, self.frame.size.height-self.title.frame.origin.y-3);
    CGSize stringSize = [self.title.text sizeWithFont:self.title.font 
                                   constrainedToSize:maximumSize 
                                       lineBreakMode:self.title.lineBreakMode];
   
    CGRect dateFrame = CGRectMake(self.title.frame.origin.x, self.title.frame.origin.y, self.title.frame.size.width, stringSize.height);

    self.title.frame = dateFrame;
    [super layoutSubviews];
}

@end
