//
//  TagTableViewCell.m
//  ModerableFeedReader
//
//  Created by Sergey Klimov on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TagTableViewCell.h"
#import "Tag.h"
@implementation TagTableViewCell

@synthesize label;

- (void)configureWithObject:(Tag *)tag {
	
	
	self.label.text = tag.name;
}

@end
