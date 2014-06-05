//
//  QSProjectViewController.m
//  Project Managerment
//
//  Created by MinhTien on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSProjectViewController.h"
#import "QSProjectModel.h"
@interface QSProjectViewController ()

@end

@implementation QSProjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void ) fakeData{
    
    NSString *name = @"Sale Box";
    NSString *status = @"IN PROGRESS";
    NSString *desc = @"This is a big project for sale man";
    NSString *starDate = @"14/02/1991";
    NSString *endDate = @"14/02/2014";
    
    NSMutableArray * data = [NSMutableArray array];
    for (NSInteger index = 0; index<20; index++) {
        QSProjectModel *projectModel = [[QSProjectModel alloc]init];
        projectModel.name = name;
        projectModel.status = status;
        projectModel.desc = desc;
        projectModel.startDate = starDate;
        projectModel.endDate = endDate;
        [data addObject:projectModel];
    }
    self.items = [data copy];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fakeData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    @throw [NSException exceptionWithName:@"Exception" reason:@"Implement in subclass" userInfo:nil];
}
@end
