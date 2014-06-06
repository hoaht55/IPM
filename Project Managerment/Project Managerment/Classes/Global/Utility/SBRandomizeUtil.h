//
//  SBRandomizeUtil.h
//  SalesBox
//
//  Created by Socoboy on 4/28/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBRandomizeUtil : NSObject
+ (NSString *)genRandStringLength:(int)len;
+ (NSString *)genFixedRandStringLength:(int)len;
+ (int)genRandIntWithMax:(int)max;
+ (NSDate *)genRandDate;
+ (BOOL)genRandBOOL;
+ (id)randomValueFromArray:(NSArray *)array;
@end
