//
//  NSArray+Sort.h
//  SalesBox
//
//  Created by Cừu Lười on 4/30/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Sort)

- (NSArray *)sortWithKeyPath:(NSString *)keyPath byGivenArray:(NSArray *)givenArray;

@end
