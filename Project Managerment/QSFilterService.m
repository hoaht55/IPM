//
//  QSFilterService.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/9/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSFilterService.h"
#import "QSSprintModel.h"

@implementation QSFilterService

- (void)fakeModel
{
    self.listName = @[@"List staffs",@"View default role", @"List roles", @"View staff detail"];
    self.listStatus = @[@"IN PROGESS", @"IN PENDING", @"COMPLETE", @"IN PENDING"];
    self.listDesc = @[@"In oder to view all staffs on a company",
                      @"There are role were created by DIS and dealer could not edit or delete them",
                      @"In order to view all of role list for staff in one company including default roles that be created by DISIn order to view all of role list for staff in one company including default roles that be created by DISIn order to view all of role list for staff in one company including default roles that be created by DIS",
                      @"Apple just unveiled iOS 8 at the Developer's Conference, and it has a lot of exciting features to play around with."];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger index = 0; index < 4; index++) {
        QSSprintModel *sprintModel = [[QSSprintModel alloc] init];
        sprintModel.name = self.listName[index];
        sprintModel.status = self.listStatus[index];
        sprintModel.desc = self.listDesc[index];
        sprintModel.screen = @"4_Role\n4_Role";
        sprintModel.assignee = @"hungt\nabc";
        [array addObject:sprintModel];
    }
    self.listData = [array copy];
    //self.sprintList = [array copy];
    //self.currentSprint = [array copy];
}
-(NSArray *)getAllData
{
    [self fakeModel];
    return self.listData;
}
- (NSArray *)filterSprint:(NSString *)value
{
    NSMutableArray * array = [NSMutableArray array];
    if ([value isEqualToString:@"1"]) {
        for (NSInteger index = 0; index < self.sprintList.count; index ++) {
            QSSprintModel * model  = [self.sprintList objectAtIndex:index];
            if ([model.status isEqualToString:@"IN PROGESS"]) {
                [array addObject:model];
            }
        }
    }
    else if ([value isEqualToString:@"2"])
    {
        NSLog(@"Demo 2");
            
    }
    else if ([value isEqualToString:@"3"])
    {
        NSLog(@"Demo 3");
    }
    else
    {
        array = [self.sprintList copy];
    }
    return array;
}
@end
