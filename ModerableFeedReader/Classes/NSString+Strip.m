//
//  NSString+Strip.m
//  TVFansMagazine
//
//  Created by Sergey Klimov on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+Strip.h"
#import "NSString+HTML.h"
@implementation NSString (Strip)
- (NSString *) fullStrippedString {
    return [[[self stringByConvertingHTMLToPlainText]  componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""];
}
@end
