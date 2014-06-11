//
//  QSAppPreference.h
//  IPM
//
//  Created by Cừu Lười on 5/15/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//
#import <UIKit/UIKit.h>

#define Is_In_Landscape_Mode UIInterfaceOrientationIsLandscape([QSAppPreference currentOrientation])

@interface QSAppPreference : NSObject

+ (UIColor *)blueColor;
+ (UIColor *)disableBlueColor;
+ (UIColor *)lightGrayColor;
+ (UIColor *)dardGrayColor;
+ (UIColor *)screenBackgroundColor;
+ (UIColor *)lineColor;

+ (UIFont *)boldFontWithSize:(CGFloat)size;
+ (UIFont *)regularFontWithSize:(CGFloat)size;
+ (UIFont *)italicFontWithSize:(CGFloat)size;

+ (UIInterfaceOrientation)currentOrientation;
+ (BOOL)isIpad;

@end
