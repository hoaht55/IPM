//
//  QSMoreViewController_iPhone.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/6/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSMoreViewController_iPhone.h"
#import "QSMoreViewCell_iPhone.h"

@interface QSMoreViewController_iPhone ()
@property (strong, nonatomic) NSArray *array;
@end

@implementation QSMoreViewController_iPhone

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
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QSMoreViewCell_iPhone class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QSMoreViewCell_iPhone class])];
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.checkedIndex = indexPath;
    [tableView reloadData];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QSMoreViewCell_iPhone  *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSMoreViewCell_iPhone class])];
    CGFloat height = self.tableView.rowHeight;
    height *= self.array.count;
    CGRect tableFrame = self.tableView.frame;
    tableFrame.size.height = height;
    self.tableView.frame = tableFrame;

    if (cell == nil) {
        cell = [[QSMoreViewCell_iPhone alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([QSMoreViewCell_iPhone class])];
    }
    
    //cell.titleLabel.text = _array[indexPath.row];
    //[cell.titleLabel setText:_array[indexPath.row]];
    cell.titleLabel.text = _array[indexPath.row];
    if ([self.checkedIndex isEqual:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
