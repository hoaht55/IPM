//
//  UIView+AutoLayout.m
//  SalesBox
//
//  Created by Socoboy on 4/29/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)
- (void)removeAllConstraints {
    [self removeConstraints:self.constraints];
}
@end
