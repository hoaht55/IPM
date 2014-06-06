//
//  QSFilterPopoverBackground.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/5/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSFilterPopoverBackground.h"

#define kArrowBase 30.0f
#define kArrowHeight 20.0f
#define kBorderInset 8.0f

@implementation QSFilterPopoverBackground

@synthesize arrowDirection  = _arrowDirection;
@synthesize arrowOffset     = _arrowOffset;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

+ (CGFloat)arrowBase
{
    return kArrowBase;
}

+ (CGFloat)arrowHeight
{
    return kArrowHeight;
}

+ (UIEdgeInsets)contentViewInsets
{
    return UIEdgeInsetsMake(kBorderInset, kBorderInset, kBorderInset,       kBorderInset);
}



@end
