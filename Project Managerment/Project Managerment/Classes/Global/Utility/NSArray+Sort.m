//
//  NSArray+Sort.m
//  SalesBox
//
//  Created by Cừu Lười on 4/30/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import "NSArray+Sort.h"
#import <objc/runtime.h>

@implementation NSArray (Sort)

- (NSArray *)sortWithKeyPath:(NSString *)keyPath byGivenArray:(NSArray *)givenArray
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSMutableArray *undefineObjectKey = [NSMutableArray array];
    for (id object in self) {
        NSString *key;
        if (keyPath) {
            key = [object valueForKeyPath:keyPath];
            if (!key) {
                key = @"";
            }
        } else {
            key = object;
        }
        
        if ([givenArray containsObject:key]) {
            NSMutableArray *arrayValue = [dict objectForKey:key];
            if (!arrayValue) {
                arrayValue = [NSMutableArray array];
                [dict setObject:arrayValue forKey:key];
            }
            [arrayValue addObject:object];
        } else {
            [undefineObjectKey addObject:object];
        }
    }
    NSMutableArray *resultArray = [NSMutableArray array];
    for (NSString *key in givenArray) {
        NSArray * object = [dict objectForKey:key];
        if (object) {
            [resultArray addObjectsFromArray:object];
        }
    }
    [resultArray addObjectsFromArray:undefineObjectKey];
    return  resultArray;
}
@end
