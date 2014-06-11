//
//  QSProjectViewController.m
//  Project Managerment
//
//  Created by MinhTien on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSProjectViewController.h"
#import "QSProjectModel.h"
#import "QSProjectCell_IPhone.h"
#import "QSProjectCell.h"
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
    for (NSInteger index = 0; index<2; index++) {
        QSProjectModel *projectModel = [[QSProjectModel alloc]init];
        projectModel.name = name;
        projectModel.status = status;
        projectModel.desc = desc;
        projectModel.startDate = starDate;
        projectModel.endDate = endDate;
        [data addObject:projectModel];
    }
    
    NSString *name2 = @"Logictic ";
    NSString *status2 = @"IN PENDING";
    NSString *desc2 = @"This is a big project for sale man. This is a big project for sale man, This is a big project for sale man,This is a big project for sale man This is a big project for sale man, ThiThis is a big project for sale man. This is a big project for sale man, This is a big project for sale man,This is a big project for sale man This is a big project for sale man, ThiThis is a big project for sale man. ";
    NSString *starDate2 = @"14/02/1991";
    NSString *endDate2 = @"14/02/2014";
   
    for (NSInteger index = 0; index<6; index++) {
        QSProjectModel *projectModel = [[QSProjectModel alloc]init];
        projectModel.name = name2;
        projectModel.status = status2;
        projectModel.desc = desc2;
        projectModel.startDate = starDate2;
        projectModel.endDate = endDate2;
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


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    @throw [NSException exceptionWithName:@"Exception" reason:@"Implement in subclass" userInfo:nil];
    //return self.tableView.estimatedRowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    @throw [NSException exceptionWithName:@"Exception" reason:@"Implement in subclass" userInfo:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.row = indexPath.row;
    
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                initWithTitle:@"Row Selected" message:@"You've selected a row " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display Alert Message
    [messageAlert show];
    NSLog(@"Row: %d",self.row);
}

//- (QSProjectCell *) projectCell {
//    if (!_projectCell) {
//        _projectCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([QSProjectCell class]) owner:self options:nil] firstObject];
//    }
//    return _projectCell;
//}

@end
