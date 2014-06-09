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
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger index = 0; index < 10; index++) {
        QSSprintModel *sprintModel = [[QSSprintModel alloc] init];
        sprintModel.name = [NSString stringWithFormat:@"Filter  %li", (long)index];
        sprintModel.status = @"CONTINUE";
        sprintModel.desc = @"Apple just unveiled iOS 8 at the Developer's Conference, and it has a lot of exciting features to play around with.";
        sprintModel.screen = @"4_Role";
        sprintModel.assignee = @"hungtv";
        [array addObject:sprintModel];
    }
    QSSprintModel * model = [[QSSprintModel alloc]init];
    model.name = @"Sale";
    model.status = @"IN PROGESS";
    model.desc = @"vnexpress.net";
    model.screen = @"screen";
    model.assignee =@"assignee";
    [array addObject:model];
    self.sprintList = [array copy];
    self.currentSprint = [array copy];
    
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
    }else if ([value isEqualToString:@"2"]) {
            NSLog(@"Demo 2");
            
    }else if ([value isEqualToString:@"3"]) {
                NSLog(@"Demo 3");
    }else{
                array = [self.sprintList copy];

    }
    return array;
}
@end
