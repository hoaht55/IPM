//
//  DISPhoneCallUtil.m
//  iOSUtility
//
//  Created by QuangPC on 2/21/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import "DISPhoneCallUtil.h"

@implementation DISPhoneCallUtil

+ (void)makePhoneCallWithNumber:(NSString *)phoneNumber {
    NSString *cleanedString = [[phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
    NSString *number = [NSString stringWithFormat:@"telprompt:%@", cleanedString];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:number]];
}

@end
