//
//  QSProjectModel.h
//  Project Managerment
//
//  Created by MinhTien on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QSProjectModel : NSObject

@property (weak,nonatomic) NSString *name;
@property (weak,nonatomic) NSString *status;
@property (weak,nonatomic) NSString *desc;
@property (weak,nonatomic) NSString *startDate;
@property (weak,nonatomic) NSString *endDate;

@end
