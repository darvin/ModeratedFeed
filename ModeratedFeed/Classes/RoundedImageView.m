//
//  RoundedImageView.m
//  ModerableFeedReader
//
//  Created by Sergey Klimov on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "RoundedImageView.h"

@implementation RoundedImageView

- (id) initWithCoder:(NSCoder *)aDecoder {
    if (self=[super initWithCoder:aDecoder]) {
        CALayer * l = [self layer];
        [l setMasksToBounds:YES];
        [l setCornerRadius:10.0];
    }
    return self;
}
@end
