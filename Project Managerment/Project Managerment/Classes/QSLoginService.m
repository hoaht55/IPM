//
//  QSLoginService.m
//  Project Managerment
//
//  Created by Nguyen Van Quyen on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSLoginService.h"
#import "QSUserModel.h"


@implementation QSLoginService

// fake data
- (BOOL)checkkLogin: (QSUserModel *)userModel
{
    if ([userModel.email isEqualToString: @"admin"] && [userModel.password isEqualToString:@"admin"]) {
        return TRUE;
    }
    return FALSE;
}
@end
