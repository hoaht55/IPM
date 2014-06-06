//
//  UILabel+FrameCaculation.m
//  SalesBox
//
//  Created by Socoboy on 5/15/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import "UILabel+FrameCaculation.h"

@implementation UILabel (FrameCaculation)
- (CGFloat)fitableWidthInTextMode {
    CGSize maxSize = CGSizeMake(CGFLOAT_MAX, self.frame.size.height);
    CGSize expectedSize = [self sizeThatFits:maxSize];
    
    return expectedSize.width;
}

- (CGFloat)fitableWidthInAttributedTextMode {
    CGSize maxSize = CGSizeMake(CGFLOAT_MAX, self.frame.size.height);
    CGSize expectedSize = [self sizeThatFits:maxSize];
    
    return expectedSize.width;
}

- (CGFloat)fitableHeightInTextMode {
    CGSize maxSize = CGSizeMake(self.frame.size.width, CGFLOAT_MAX);
    CGSize expectedSize = [self sizeThatFits:maxSize];
    
    return expectedSize.height;
}

- (CGFloat)fitableHeightInAttributedTextMode {
    CGSize maxSize = CGSizeMake(self.frame.size.width, CGFLOAT_MAX);
    CGSize expectedSize = [self sizeThatFits:maxSize];
    
    return expectedSize.height;
}

@end
