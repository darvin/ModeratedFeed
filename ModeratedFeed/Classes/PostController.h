//
//  PostController.h
//  ModerableFeedReader
//
//  Created by Sergey Klimov on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@interface PostController : UIViewController
@property (strong, nonatomic) Post* post;
- (IBAction)share:(id)sender;
@end
