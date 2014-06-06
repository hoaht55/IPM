//
//  NSObject+DIS.m
//  iOSUtility
//
//  Created by QuangPC on 2/19/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import "NSObject+DIS.h"
#import <objc/runtime.h>

@implementation NSObject (DIS)

-(NSDictionary *)propertiesListAndValue {
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithFormat:@"%s",property_getName(property)];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

-(NSArray *)propertiesArray {
    NSMutableArray *props = [[NSMutableArray alloc] init];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithFormat:@"%s",property_getName(property)];
        [props addObject:propertyName];
    }
    free(properties);
    return props;
}

+ (NSDictionary *)classMaping {
    return nil;
}

- (NSString *)jsonString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self propertiesListAndValue] options:NSJSONWritingPrettyPrinted error:NULL];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return result;
}

- (NSArray *)propertiesArrayWithLimitedClass:(Class)className {
    NSMutableArray *props = [[NSMutableArray alloc] init];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithFormat:@"%s",property_getName(property)];
        [props addObject:propertyName];
    }
    Class superClass = class_getSuperclass([self class]);
    Class currentClass = [self class];
    
    while (![NSStringFromClass(className) isEqualToString:NSStringFromClass(currentClass)]) {
        unsigned int newCount = 0;
        objc_property_t *properties1 = class_copyPropertyList(superClass, &newCount);
        for (i = 0; i < newCount; i++) {
            objc_property_t property = properties1[i];
            NSString *propertyName = [[NSString alloc] initWithFormat:@"%s",property_getName(property)];
            [props addObject:propertyName];
        }
        free(properties1);        
        currentClass = superClass;
        superClass = class_getSuperclass(superClass);
    }
    free(properties);
    return props;
}

@end
