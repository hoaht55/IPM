//
//  QSLoginService.h
//  Project Managerment
//
//  Created by Nguyen Van Quyen on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QSUserModel;
@interface QSLoginService : NSObject
- (BOOL)checkkLogin:(QSUserModel *)userModel;
@end