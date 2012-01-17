//
//  PostTableViewCell.h
//  ModerableFeedReader
//
//  Created by Sergey Klimov on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FRCTableViewCell.h"

@interface PostTableViewCell : FRCTableViewCell
@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) IBOutlet UILabel *authorName;
@property (nonatomic, strong) IBOutlet UIImageView *authorPicture;

@end
