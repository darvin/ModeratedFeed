//
//  AuthorTableViewCell.h
//  ModerableFeedReader
//
//  Created by Sergey Klimov on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FRCTableViewCell.h"
#import "UIImageView+WebCache.h"


@interface AuthorTableViewCell : FRCTableViewCell
@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) IBOutlet UILabel *authorName;
@property (nonatomic, strong) IBOutlet UIImageView *authorPicture;

@end
