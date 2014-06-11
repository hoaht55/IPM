//
//  QSAppPreference.m
//  IPM
//
//  Created by Cừu Lười on 5/15/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSAppPreference.h"

@implementation QSAppPreference

+ (UIColor *)lineColor
{
    static UIColor *color;
    if (!color) {
        color = [UIColor colorWithRed:186/255.0 green:191/255.0 blue:196/255.0 alpha:1.0];
    }
    return color;
}


+ (UIColor *)screenBackgroundColor
{
    static UIColor *color;
    if (!color) {
        color = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1.0];
    }
    return color;
}


+ (UIColor *)dardGrayColor
{
    static UIColor *color;
    if (!color) {
        color = [UIColor colorWithRed:99/255.0 green:108/255.0 blue:113/255.0 alpha:1.0];
    }
    return color;
}


+ (UIColor *)lightGrayColor
{
    static UIColor *color;
    if (!color) {
        color = [UIColor colorWithRed:172/255.0 green:178/255.0 blue:181/255.0 alpha:1.0];
    }
    return color;
}


+ (UIColor *)blueColor
{
    static UIColor *color;
    if (!color) {
        color = [UIColor colorWithRed:6/255.0 green:114/255.0 blue:186/255.0 alpha:1.0];
    }
    return color;
}

+ (UIColor *)disableBlueColor
{
    static UIColor *color;
    if (!color) {
        color = [UIColor colorWithRed:6/255.0 green:114/255.0 blue:186/255.0 alpha:0.3];
    }
    return color;
}


+ (UIFont *)boldFontWithSize:(CGFloat)size
{
    UIFont *font;
    if (!font) {
        font = [UIFont boldSystemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)regularFontWithSize:(CGFloat)size
{
    UIFont *font;
    if (!font) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)italicFontWithSize:(CGFloat)size
{
    UIFont *font;
    if (!font) {
        font = [UIFont italicSystemFontOfSize:size];
    }
    return font;
}

+ (BOOL)isIpad
{
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

+ (UIInterfaceOrientation)currentOrientation
{
    return [UIApplication sharedApplication].statusBarOrientation;
}

@end
