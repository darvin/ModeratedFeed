//
//  AuthorTableViewCell.m
//  ModerableFeedReader
//
//  Created by Sergey Klimov on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AuthorTableViewCell.h"
#import "Author.h"
#import "UIImageView+WebCache.h"
@implementation AuthorTableViewCell
@synthesize title, authorName, authorPicture;

- (void)configureWithObject:(Author *)author {
	
	
	self.title.text = author.title;
    self.authorName.text = author.name;
    if (author.imageURL)
        [self.authorPicture setImageWithURL:[NSURL URLWithString:author.imageURL]];
}

@end
