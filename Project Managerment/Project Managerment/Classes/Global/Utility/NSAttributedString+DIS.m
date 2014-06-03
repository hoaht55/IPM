//
//  NSAttributedString+DIS.m
//  iOSUtility
//
//  Created by QuangPC on 2/20/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import "NSAttributedString+DIS.h"

@implementation NSAttributedString (DIS)

- (CGFloat)boundingHeightForFixedWidth:(CGFloat)width {
    CGSize constrainSize = CGSizeMake(width, MAXFLOAT);
    CGRect rect = [self boundingRectWithSize:constrainSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return ceilf(rect.size.height);
}

- (CGRect)boundingRectForWidth:(CGFloat)width {
    CGSize constrainSize = CGSizeMake(width, MAXFLOAT);
    CGRect rect = [self boundingRectWithSize:constrainSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return rect;
}
@end
