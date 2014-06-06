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


- (BOOL)checkLogin: (QSUserModel *)userModel
{
    [self fakeData];
    NSString * userPass = [self.userList objectForKey: userModel.email];
    if ([userPass isEqualToString: userModel.password]) {
        return TRUE;
    }
    return FALSE;
 }

- (BOOL)checkEmailExists: (QSUserModel *)userModel
{
    [self fakeData];
    NSString * userPass = [self.userList objectForKey: userModel.email];
    if (userPass != nil) {
        return TRUE;
    }
    return FALSE;
    
}
- (void)fakeData
{
    NSMutableArray * userAndPassArray = [NSMutableArray array];
    for (NSInteger i = 0; i< 100; i++) {
        NSString * userAndPass = [NSString stringWithFormat:@"user%d", i];
        [userAndPassArray addObject:userAndPass];
    }
    self.userList = [NSDictionary dictionaryWithObjects:userAndPassArray forKeys:userAndPassArray];
}
@end
