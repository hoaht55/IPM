//
//  SBRandomizeUtil.m
//  SalesBox
//
//  Created by Socoboy on 4/28/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import "SBRandomizeUtil.h"

@implementation SBRandomizeUtil
+ (NSString *)genRandStringLength:(int)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    len = rand() % len;
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}

+ (NSString *)genFixedRandStringLength:(int)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}

+ (int)genRandIntWithMax:(int)max {
    return arc4random() % max;
}

+ (NSDate *)genRandDate {
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:today];
    NSRange days = [calendar rangeOfUnit:NSDayCalendarUnit
                                  inUnit:NSMonthCalendarUnit
                                 forDate:today];
    
    int r = arc4random() % days.length;
    [dateComponents setDay:r];
    return [calendar dateFromComponents:dateComponents];
}

+ (BOOL)genRandBOOL {
    int tmp = (arc4random() % 30)+1;
    if(tmp % 5 == 0)
        return YES;
    return NO;
}

+ (id)randomValueFromArray:(NSArray *)array {
    int index = arc4random() % (array.count - 1);
    return array[index];
}
@end
