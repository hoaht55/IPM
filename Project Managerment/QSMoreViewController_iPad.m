//
//  QSMoreViewController_iPad.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/6/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSMoreViewController_iPad.h"
#import "QSMoreViewCell_iPad.h"
@interface QSMoreViewController_iPad ()

@end

@implementation QSMoreViewController_iPad

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
    _array = @[@"Service Schedule",@"Edit", @"Delete"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QSMoreViewCell_iPad class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QSMoreViewCell_iPad class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QSMoreViewCell_iPad  *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSMoreViewCell_iPad class])];
    if (cell == nil) {
        cell = [[QSMoreViewCell_iPad alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([QSMoreViewCell_iPad class])];
    }
    
    //cell.titleLabel.text = _array[indexPath.row];
    //[cell.titleLabel setText:_array[indexPath.row]];
    cell.titleLabel.text = _array[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
