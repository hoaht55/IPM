//
//  QSFilterTableViewController_iPad.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/6/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSFilterTableViewController_iPad.h"
#import "QSFilterTableViewCell_iPad.h"
@interface QSFilterTableViewController_iPad ()

@end

@implementation QSFilterTableViewController_iPad

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
    _array = @[@"View All",@"View Progess",@"View In Pending", @"View Complete"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QSFilterTableViewCell_iPad class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QSFilterTableViewCell_iPad class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QSFilterTableViewCell_iPad *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSFilterTableViewCell_iPad class])];
    if (cell == nil) {
        cell = [[QSFilterTableViewCell_iPad alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([QSFilterTableViewCell_iPad class])];
    }
    
    //cell.titleLabel.text = _array[indexPath.row];
    //[cell.titleLabel setText:_array[indexPath.row]];
    cell.titleLabel.text = _array[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
