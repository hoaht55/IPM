//
//  UILabel+FrameCaculation.h
//  SalesBox
//
//  Created by Socoboy on 5/15/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FrameCaculation)
- (CGFloat)fitableWidthInTextMode;
- (CGFloat)fitableWidthInAttributedTextMode;
- (CGFloat)fitableHeightInTextMode;
- (CGFloat)fitableHeightInAttributedTextMode;
@end
