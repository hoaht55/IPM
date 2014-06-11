//
//  QSAddAndEditViewController_iPhone.m
//  Project Managerment
//
//  Created by Duong Huu Hieu on 6/11/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSAddAndEditViewController_iPhone.h"

@interface QSAddAndEditViewController_iPhone ()

@end

@implementation QSAddAndEditViewController_iPhone

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 1) {
        return 44;
    }
    return 350;
}

@end
