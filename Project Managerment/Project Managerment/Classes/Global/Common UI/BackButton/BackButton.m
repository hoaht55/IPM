//
//  BackButton.m
//  SalesBox
//
//  Created by truonghm on 4/29/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import "BackButton.h"

@implementation BackButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (BackButton *)getObject{
    return (BackButton *)[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BackButton class]) owner:self options:Nil] objectAtIndex:0];
}

- (void)setTarget:(id)target andSelector:(SEL)selector{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [((UIButton *)view) addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        }
    }
}
@end
