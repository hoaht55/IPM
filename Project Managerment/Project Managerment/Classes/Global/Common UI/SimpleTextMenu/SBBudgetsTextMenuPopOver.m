//
//  SBTextMenuPopOver.m
//  SalesBox
//
//  Created by QuangPC on 4/16/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import "SBBudgetsTextMenuPopOver.h"

@interface SBBudgetsTextMenuPopOver ()
{
    NSInteger _currentSelected;
}

@property (strong, nonatomic) NSArray *dataSource;

@end
#define SBBlackColor [UIColor blackColor]
#define SBFontRegular(v) [UIFont fontWithName:@"OpenSans" size:v]
static CGFloat kDefaultRowHeight = 44.0;
static NSInteger kMaxRowIpad = 10;
static NSInteger kMaxRowIphone = 5;

@implementation SBBudgetsTextMenuPopOver
@synthesize defaultIndexSelected = _defaultIndexSelected;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _defaultIndexSelected = -1;
    _currentSelected = -1;
    
    self.view.frame = CGRectMake(0, 0, 160, 100);
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = YES;
}

- (void) viewWillAppear:(BOOL)animated
{
    NSInteger numRow = [self.tableView numberOfRowsInSection:0];
    for (int i = 0; i < numRow; i++) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (i == _currentSelected) {
            cell.accessoryView = [self checkMartImageView];
        }
        else {
            cell.accessoryView = nil;
        }
    }
}

-(void) setDefaultIndexSelected: (NSInteger) value
{
    _defaultIndexSelected = value;
    _currentSelected = value;
}

- (CGFloat)contentHeight {
    if (!_dataSource) {
        return kDefaultRowHeight -2;
    }
    if (_dataSource.count > kMaxRowIphone) {
        return kMaxRowIphone * kDefaultRowHeight - 2;
    }
    return _dataSource.count * kDefaultRowHeight - 2;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kDefaultRowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *menuCell = @"SBTextMenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuCell];
    }
    
    // Configure the cell...
    cell.textLabel.textColor = SBBlackColor;
    cell.textLabel.font = SBFontRegular(14);
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    if (_currentSelected == indexPath.row) {
        cell.accessoryView = [self checkMartImageView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else {
        cell.accessoryView = nil;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UITableViewCell *cell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_currentSelected inSection:0]];
    if (cell1 && cell1.accessoryView) {
        cell1.accessoryView = nil;
    }
    
    if (!cell.accessoryView) {
        [cell setAccessoryView:[self checkMartImageView]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    _currentSelected = [indexPath row];
    NSString *value = [_dataSource objectAtIndex:indexPath.row];
    if (self.didSelectCellAtIndex) {
        self.didSelectCellAtIndex(indexPath.row, value);
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryView:nil];
}

-(UIImageView *)checkMartImageView
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_tick_active"]];
}

@end
