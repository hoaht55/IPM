//
//  BackButton.h
//  SalesBox
//
//  Created by truonghm on 4/29/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackButton : UIView

+ (BackButton *)getObject;
- (void)setTarget:(id)target andSelector:(SEL)selector;
@end
