//
//  QSFilterService.h
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/9/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QSSprintModel.h"

@interface QSFilterService : NSObject
@property (nonatomic, strong) QSSprintModel * model;
@property (nonatomic, strong) NSArray *sprintList;
@property (nonatomic, strong) NSArray *currentSprint;

- (NSArray *)filterSprint:(NSString *)value;
@end
