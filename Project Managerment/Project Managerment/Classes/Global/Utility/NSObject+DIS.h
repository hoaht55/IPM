//
//  NSObject+DIS.h
//  iOSUtility
//
//  Created by QuangPC on 2/19/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DIS)

- (NSDictionary *)propertiesListAndValue;

- (NSArray *)propertiesArray;

+ (NSDictionary *)classMaping;

- (NSString *)jsonString;

- (NSArray *)propertiesArrayWithLimitedClass:(Class)className;

@end
