//
//  SBTextMenuPopOver.m
//  SalesBox
//
//  Created by QuangPC on 4/16/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import "SBTextMenuPopOver.h"

@interface SBTextMenuPopOver ()
@property (strong, nonatomic) NSArray *dataSource;
@end
#define SBSeparateTableViewColor [UIColor colorWithRed:188.0/255 green:188.0/255 blue:188.0/255 alpha:1.0]
#define H3_SBColor [UIColor blackColor]
#define H3_SBFont [UIFont fontWithName:@"OpenSans" size:16]
#define SBRedColor [UIColor colorWithRed:237.0/255 green:104.0/255 blue:78.0/255 alpha:1.0]
#define SBBlackColor [UIColor blackColor]
#define SBGreenColer [UIColor colorWithRed:10.0/255 green:126.0/255 blue:223.0/255 alpha:1.0]

static CGFloat kDefaultRowHeight = 44.0;
static NSInteger kMaxRowIpad = 10;
static NSInteger kMaxRowIphone = 5;

@implementation SBTextMenuPopOver

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _notShowCheckmark = NO;
    }
    return self;
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    [self.tableView reloadData];
}

- (NSArray*)getDataSource
{
    return _dataSource;
}

- (void)setSelectedIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath;
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, 160, 100);
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.separatorColor = SBSeparateTableViewColor;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)contentHeight {
    if (!_dataSource) {
        return kDefaultRowHeight;
    }

    if (_dataSource.count > kMaxRowIphone) {
        return kMaxRowIphone * kDefaultRowHeight;
    }
    
    return _dataSource.count * kDefaultRowHeight;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the cell...
    cell.textLabel.textColor = H3_SBColor;
    cell.textLabel.font = H3_SBFont;
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    if (self.selectedIndex && self.selectedIndex.row == indexPath.row && self.selectedIndex.section == indexPath.section) {
        UIImageView *checkMartImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_tick_active"]];
        [cell setAccessoryView:checkMartImageView];
        cell.textLabel.textColor = SBRedColor;
    } else {
        [cell setAccessoryView:nil];
        cell.textLabel.textColor = SBGreenColer;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_notShowCheckmark) {
        self.selectedIndex = nil;
    } else {
        self.selectedIndex = indexPath;
        [tableView reloadData];
        
    }
    
    NSString *value = [_dataSource objectAtIndex:indexPath.row];
    if (self.didSelectCellAtIndex) {
        self.didSelectCellAtIndex(indexPath.row, value);
    }
}

@end
