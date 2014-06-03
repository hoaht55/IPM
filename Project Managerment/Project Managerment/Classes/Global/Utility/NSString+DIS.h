//
//  NSString+DIS.h
//  iOSUtility
//
//  Created by QuangPC on 2/19/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DIS)

#pragma mark -
#pragma mark Class methods
+ (NSString *)stringWithUUID;

+ (NSString *)base64StringFromData:(NSData *)data length:(int)length;

#pragma mark -
#pragma mark Instance methods
/**
 *  Check if string is valid email address
 *
 *  @return true if is valid email, false if invalid email string
 */
- (BOOL)isValidEmail;

/**
 *  Check if string is white space and new line
 *
 *  @return bool
 */
- (BOOL)isWhitespaceAndNewlines;

/**
 *  Check if string is empty or white space
 *
 *  @return bool
 */
- (BOOL)isEmptyOrWhitespace;

/**
 *  Return md5 string from original string
 *
 *  @return md5 string
 */
- (NSString *)md5;

/**
 *  trim white space in string
 *  eg: @"   abc   xyz   " will become @"abc   xyz"
 *
 *  @return string with no space in head and tail
 */
- (NSString *)trimWhiteSpace;

/**
 *  Remove all white spaces of string
 *  eg: @"  a a   a   " become @"aaa"
 *
 *  @return string without space
 */
- (NSString *)removeAllWhitespaces;


/**
 * Eg: viewController -> view_controller
 */
- (NSString *)objcVariableNameStyleToDBNameStyle;

- (float) getHeightWithFont:(UIFont*)font andWidth:(float)width;
- (float) getWidthWithFont:(UIFont*)font andHeight:(float)height;

/**
 * Eg: 0->100 (%)
 * Eg: 69.96 (%)
 */
- (BOOL)isDecimalNumberWithTwoDecimal;


- (BOOL)isNumber;


/*
 *  Eg: 2.5 or 2.0
 */

- (BOOL) isDecimal;

/*
 *  Eg: number without '.' or ','
 */
- (BOOL) isNumberWithoutDecimal;

-(BOOL) checkValidNumberOfCellBudgets;

- (BOOL)isOnlyNumber;

- (NSString *)trimToValidNumber;

- (NSString *)trimToValidText;

- (NSDate *)dateInUTCWithFormat:(NSString *)format;

- (NSString *)dateInUTCTimeWithLocalFormat:(NSString *)localTimeFormat andUTCFormat:(NSString *)UTCTimeFormat;
@end