//
//  Lib.m
//  UITableViewCellCustom
//
//  Created by Quach Ngoc Tam on 2/27/14.
//  Copyright (c) 2014 QsoftVietNam. All rights reserved.
//

#import "Lib.h"
#import "QSAppPreference.h"

@implementation Lib

+ (int)lineCountForLabel:(UILabel *)label {
    CGSize constrain = CGSizeMake(label.bounds.size.width, FLT_MAX);
    CGSize size = [label.text sizeWithFont:label.font constrainedToSize:constrain lineBreakMode:NSLineBreakByWordWrapping];
    return ceil(size.height / label.font.lineHeight);
}

+(float)sizeOfText:(NSString *)textToMesure widthOfTextView:(CGFloat)width withFont:(UIFont*)font{
    CGSize ts = [textToMesure sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return ts.height;
}

+ (CGRect)frameLablePortraitBefore:(UILabel*)before LableAfter:(UILabel*)after{
    CGRect frameAfter = after.frame;
    frameAfter.origin.y = before.frame.origin.y + before.frame.size.height;
    return frameAfter;
}

+ (void)setFrameUIlabelUnder:(UILabel*)lbUnder UIlabelOn:(UILabel*)lbOn{
    CGRect rectlbUnder = [Lib frameLablePortraitBefore:lbOn LableAfter:lbUnder];
    rectlbUnder.size.height = [Lib sizeOfText:lbUnder.text widthOfTextView:lbUnder.frame.size.width withFont:lbUnder.font];
    
    if (lbUnder.numberOfLines==1) {
        rectlbUnder.size.height = 21;
    }
    
    if (lbUnder.text.length==0) {
        rectlbUnder.size.height = 0;
    }
    lbUnder.frame = rectlbUnder;
}

+ (void)setFontWithRange:(UILabel *)label withRange:(NSRange)range OtherFont:(UIFont *)otherfont OtherColor:(UIColor*)orthercolor{
    if ([label respondsToSelector:@selector(setAttributedText:)]){
        // iOS6 and above : Use NSAttributedStrings
        // Create the attributes
        NSDictionary *attrs = @{NSFontAttributeName: label.font};
        NSDictionary *subAttrs = @{NSFontAttributeName: otherfont, NSForegroundColorAttributeName:orthercolor};
        
        // Create the attributed string (text + attributes)
        NSMutableAttributedString *attributedText =[[NSMutableAttributedString alloc] initWithString:label.text
                                                                                          attributes:attrs];
        [attributedText setAttributes:subAttrs range:range];
        // Set it in our UILabel and we are done!
        [label setAttributedText:attributedText];
    }
}

+ (NSString *)localizedCurrenctyForValue:(double)value{
    NSNumberFormatter * numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setCurrencyCode:@"USD"];
    [numberFormatter setNegativeFormat:@"###0.##"];
    [numberFormatter setMinimumFractionDigits:0];
    [numberFormatter setMaximumFractionDigits:2];
    return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:value]];
}

+ (UIBarButtonItem *)barButtonItemFromImage:(NSString *)imageName withTarget:(id)target andAction:(SEL)action {
    UIImage *buttonImage = [UIImage imageNamed:imageName];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

+ (UIBarButtonItem *)barButtonItemName:(NSString *)name textColor:(UIColor*)color withTarget:(id)target andAction:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.titleLabel.text = name;
    button.titleLabel.textColor = color;
    button.frame = CGRectMake(0, 0, 40, 40);
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

+ (NSAttributedString *)keyValueStyleWithKey:(NSString *)key value:(NSString *)value {
    NSMutableAttributedString *result = nil;
    NSMutableArray *joinArray = [NSMutableArray array];
    if (key) {
        [joinArray addObject:key];
    }
    
    if (value) {
        [joinArray addObject:value];
    }
    
    result = [[NSMutableAttributedString alloc] initWithString:[joinArray componentsJoinedByString:@": "]];
    
    if (key) {
        [result addAttribute:NSForegroundColorAttributeName value:[QSAppPreference lightGrayColor] range:NSMakeRange(0, key.length + 1)];
    }
    
    return [result copy];
}

@end
