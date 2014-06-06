//
//  QSSprintListViewController.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSSprintListViewController.h"
#import "QSSprintCell.h"
@interface QSSprintListViewController ()


- (void)createNavigationItem;
@end

@implementation QSSprintListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createNavigationItem];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    QSTableViewCell *cell = [[QSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QSTableViewCell"];
    QSSprintCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QSSprintCell"];
    
    if(cell == nil){
        cell.nameLabel.text = @"Name";
        cell.screenLabel.text = @"acbasbcbash";
        cell.assigneeLabel.text = @"cahscb";
    }
    return cell;
}


- (void)createNavigationItem
{
    
    NSString *titleLabel = @"Sprint 1";
    self.navigationItem.title = titleLabel;
    
//    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithImage:<#(UIImage *)#> style:UIBarButtonItemStylePlain target:self action:@selector(filter:)];
//    rightItem.tintColor = [UIColor whiteColor];
//    self.navigationItem.rightBarButtonItem = rightItem;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
