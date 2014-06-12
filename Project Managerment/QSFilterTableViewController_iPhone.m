//
//  QSFilterTableViewController_iPhone.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/6/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSFilterTableViewController_iPhone.h"
#import "QSFilterTableViewCell_iPhone.h"

@interface QSFilterTableViewController_iPhone ()
//@property (nonatomic, strong) NSArray *department;
@property (nonatomic, strong) NSArray *titleOptions;
@property (nonatomic, strong) NSString *filterNumber;

- (NSIndexPath *)getLastIndex:(NSIndexPath *)lastIndex;
- (NSIndexPath *)getIndex;
@end

@implementation QSFilterTableViewController_iPhone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (NSIndexPath *)getLastIndex:(NSIndexPath *)lastIndex
{
    self.checkedIndex = lastIndex;
    return self.checkedIndex;
}
- (NSIndexPath *)getIndex
{
    return self.checkedIndex;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //_array = @[@"View All",@"View Progess",@"View In Pending", @"View Complete"];
    
    // Add list option in popover
    self.titleOptions = @[@"View All",@"View Progess",@"View In Pending", @"View Complete"];
    [self getLastIndex:self.lastIndex];
    [self.filterOptionView registerNib:[UINib nibWithNibName:@"QSFilterTableViewCell_iPhone" bundle:nil] forCellReuseIdentifier:@"QSFilterTableViewCell_iPhone"];
    
    //Get location of cell in table, cell 1, cell 2, ....
    //UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnTableViewScreenCell:)];
    //[self.filterOptionView addGestureRecognizer:tap];
    
}
//-(void) didTapOnTableViewScreenCell:(UIGestureRecognizer*) recognizer {
//    // get location touched
//    CGPoint tapLocation = [recognizer locationInView:self.filterOptionView];
//    NSIndexPath *indexPath = [self.filterOptionView indexPathForRowAtPoint:tapLocation];
//    
//    
//    if (indexPath.row == 0) {
//        NSLog(@"View all");
//        self.filterNumber = @"0";
//        
//    }
//    if (indexPath.row == 1) {
//        NSLog(@"View Progess ");
//        self.filterNumber = @"1";
//    }
//    if(indexPath.row == 2){
//        NSLog(@"View In Pending");
//        self.filterNumber = @"2";
//    }
//    if (indexPath.row == 3) {
//        NSLog(@"View Complete");
//        self.filterNumber = @"3";
//    }
//    [[self myDelegate]sendValue:self.filterNumber];
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleOptions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QSFilterTableViewCell_iPhone *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSFilterTableViewCell_iPhone class])];
    
    if (cell == nil) {
        cell = [[QSFilterTableViewCell_iPhone alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([QSFilterTableViewCell_iPhone class])];
    }
    
    cell.titleLabel.text = self.titleOptions[indexPath.row];
    NSLog(@"Last index is %d", self.checkedIndex.row);
    if ([self.checkedIndex isEqual:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType=UITableViewCellAccessoryCheckmark;

    self.checkedIndex = indexPath;
    [tableView reloadData];
    NSLog(@"check index is %d", self.checkedIndex.row);

    if (self.checkedIndex.row == 0) {
        NSLog(@"View all");
        self.filterNumber = @"0";
        
    }
    if (self.checkedIndex.row == 1) {
        NSLog(@"View Progess ");
        self.filterNumber = @"1";
    }
    if(self.checkedIndex.row == 2){
        NSLog(@"View In Pending");
        self.filterNumber = @"2";
    }
    if (self.checkedIndex.row == 3) {
        NSLog(@"View Complete");
        self.filterNumber = @"3";
    }
    [[self myDelegate]sendValue:self.filterNumber];

    //checkmark for cell checked index
    if(self.checkedIndex)
    {
        UITableViewCell* uncheckCell = [tableView
                                        cellForRowAtIndexPath:self.checkedIndex];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.checkedIndex = indexPath;
    
    [tableView reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
