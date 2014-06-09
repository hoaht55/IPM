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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //_array = @[@"View All",@"View Progess",@"View In Pending", @"View Complete"];
    
    // Add list option in popover
    self.titleOptions = @[@"View All",@"View Progess",@"View In Pending", @"View Complete"];
    [self.filterOptionView registerNib:[UINib nibWithNibName:@"QSFilterTableViewCell_iPhone" bundle:nil] forCellReuseIdentifier:@"QSFilterTableViewCell_iPhone"];
    
    //Get location of cell in table
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnTableViewScreenCell:)];
    [self.filterOptionView addGestureRecognizer:tap];
    
//    self.filterNumber = @"absnbda";
//    [self.delegate didSelectViewController:self filterType:self.filterNumber];
    
}
-(void) didTapOnTableViewScreenCell:(UIGestureRecognizer*) recognizer {
    // get location touched
    CGPoint tapLocation = [recognizer locationInView:self.filterOptionView];
    NSIndexPath *indexPath = [self.filterOptionView indexPathForRowAtPoint:tapLocation];
    
    
    if (indexPath.row == 0) {
        NSLog(@"View all");
        self.filterNumber = @"0";
        
    }
    if (indexPath.row == 1) {
        NSLog(@"View Progess ");
        self.filterNumber = @"1";
    }
    if(indexPath.row == 2){
        NSLog(@"View In Pending");
        self.filterNumber = @"2";
    }
    if (indexPath.row == 3) {
        NSLog(@"View Complete");
        self.filterNumber = @"3";
    }
    [[self myDelegate]sendValue:self.filterNumber];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return _array.count;
    return self.titleOptions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QSFilterTableViewCell_iPhone *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSFilterTableViewCell_iPhone class])];
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell == nil) {
        cell = [[QSFilterTableViewCell_iPhone alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([QSFilterTableViewCell_iPhone class])];
    }
    

    //cell.titleLabel.text = _array[indexPath.row];
    cell.titleLabel.text = self.titleOptions[indexPath.row];
    //cell.textLabel.text = self.titleOptions[indexPath.row];
    
    if ([self.checkedIndex isEqual:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
////    self.checkedIndex = indexPath;
////    [tableView reloadData];
//    
////    [self.delegate didSelectViewcontroller:self department:[self.filterOptionView cellForRowAtIndexPath:indexPath].textLabel.text];
//    
//}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
