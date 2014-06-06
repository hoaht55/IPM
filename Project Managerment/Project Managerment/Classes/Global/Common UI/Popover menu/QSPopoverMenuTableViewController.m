//
//  QSPopoverMenuTableViewController.m
//  IPM
//
//  Created by Socoboy on 5/20/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSPopoverMenuTableViewController.h"
#import "QSAppPreference.h"

@interface QSPopoverMenuTableViewController ()

@end

static CGFloat const CellHeight = 45.f;

@implementation QSPopoverMenuTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _datasource = nil;
        _checkedRow = -1;
        _showCheck = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = _datasource[indexPath.row];
    if (self.showCheck && self.checkedRow == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17.0];
    cell.textLabel.textColor = [QSAppPreference blueColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

- (CGFloat)fitableHeight {
    return CellHeight * _datasource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.showCheck) {
        self.checkedRow = indexPath.row;
        [self.tableView reloadData];
    }
    
    if (self.didSelectRow) {
        self.didSelectRow(indexPath.row);
    }
}

@end
