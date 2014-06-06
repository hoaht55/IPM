//
//  Lib.h
//  UITableViewCellCustom
//
//  Created by Quach Ngoc Tam on 2/27/14.
//  Copyright (c) 2014 QsoftVietNam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Lib : NSObject
+(float)sizeOfText:(NSString *)textToMesure widthOfTextView:(CGFloat)width withFont:(UIFont*)font;
+ (void)setFrameUIlabelUnder:(UILabel*)lbUnder UIlabelOn:(UILabel*)lbOn;
+ (int)lineCountForLabel:(UILabel *)label;
+ (void)setFontWithRange:(UILabel *)label withRange:(NSRange)range OtherFont:(UIFont *)otherfont OtherColor:(UIColor*)orthercolor;
+ (NSString *)localizedCurrenctyForValue:(double)value;
+ (UIBarButtonItem *)barButtonItemFromImage:(NSString *)imageName withTarget:(id)target andAction:(SEL)action;
+ (UIBarButtonItem *)barButtonItemName:(NSString *)name textColor:(UIColor*)color withTarget:(id)target andAction:(SEL)action;
+ (NSAttributedString *)keyValueStyleWithKey:(NSString *)key value:(NSString *)value;

@end
