//
//  QSFilterViewController_iPad.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/6/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSFilterViewController_iPad.h"
#import "QSSprintModel.h"
#import "QSSprintCell.h"
#import "WYPopoverController.h"
#import "WYStoryboardPopoverSegue.h"
#import "QSFilterPopoverBackground.h"
#import "QSMoreViewController_iPad.h"
#import "QSSprintCell_iPad.h"
#import "QSFilterTableViewController_iPad.h"
#import "QSAddAndEditViewController_iPad.h"

@interface QSFilterViewController_iPad () <QSFilterTableViewController_iPadDelegate>

@property (nonatomic, strong) NSArray *sprintList;
@property (nonatomic, strong) NSArray *currentSprint;
@property (nonatomic, strong) QSFilterTableViewController_iPad *filterView;


- (void)createNavigationItem;
- (void)filterPopover:(id)sender;
- (void)moreActionPopover:(id)sender;

@end


@implementation QSFilterViewController_iPad


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
    
    // set table
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QSSprintCell_iPad class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QSSprintCell_iPad class])];
    
    // comunicate by delegate
    self.filterView.myDelegate = self;
    [[self navigationController] pushViewController:self.filterView animated:YES];
    
    // add data
    //[self fakeModel];
    self.service = [[QSFilterService alloc]init];
    self.currentSprint = [[self.service getAllData] copy];
    self.sprintList = [[self.service getAllData] copy];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationItem
{
    // Title
    NSString *title = @"Sprint 1";
    self.navigationItem.title = title;
    
    // Button in the right
    // Button for action
    NSMutableArray *arrayButton = [NSMutableArray array];
    UIImage *bt_more_action = [UIImage imageNamed:@"bt_more_menu"];
    UIBarButtonItem *more_action = [[UIBarButtonItem alloc] initWithImage:bt_more_action landscapeImagePhone:bt_more_action style:UIBarButtonItemStylePlain target:self action:@selector(moreActionPopover:)];
    // Button for filter
    UIImage *filterImage = [UIImage imageNamed:@"bt_sort"];
    UIBarButtonItem *filterButton = [[UIBarButtonItem alloc] initWithImage:filterImage landscapeImagePhone:filterImage style:UIBarButtonItemStylePlain target:self action:@selector(filterPopover:)];
    
    [arrayButton addObject:more_action];
    [arrayButton addObject:filterButton];
    
    self.navigationItem.rightBarButtonItems = arrayButton;
    
    
    // Button in the left
    UIImage *backButton = [UIImage imageNamed:@"bt_back"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:backButton landscapeImagePhone:backButton style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)filterPopover:(id)sender
{
    //    if (self.popController && [self.popController isPopoverVisible]){
    //        [self.popController dismissPopoverAnimated:YES];
    //        return;
    //    }
    
  
    
    if (!_filterView) {
        
        // create table view in popover
        _filterView = [[QSFilterTableViewController_iPad alloc] initWithNibName:@"QSFilterTableViewController_iPad" bundle:nil];
        _filterView.view.backgroundColor = [UIColor whiteColor];
        
        // comuniacation by delegate
        //self.filterView = tableViewInPop;
        _filterView.myDelegate = self;
    }

    // Open Filter Popover
    self.popController = [[WYPopoverController alloc] initWithContentViewController:_filterView];
    self.popController.popoverContentSize = CGSizeMake(768, 290);
    
    [self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];
}

- (void)moreActionPopover:(id)sender
{
    UIViewController *content = [[UIViewController alloc] init];
    content.view.backgroundColor = [UIColor whiteColor];
    
    QSMoreViewController_iPad *moreViewInPop = [[QSMoreViewController_iPad alloc] initWithNibName:NSStringFromClass([QSMoreViewController_iPad class]) bundle:nil];
    WYPopoverController *popController = [[WYPopoverController alloc] initWithContentViewController:moreViewInPop];
    popController.popoverContentSize = CGSizeMake(768, 240);
    self.popController = popController;
    [self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];
    
}


- (void)back:(id)sender
{
    NSLog(@"Back button touched !!");
}


// number of cell in table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.currentSprint.count;
}

- (QSSprintCell_iPad *) sprintCell{
    _sprintCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([QSSprintCell_iPad class]) owner:self options:nil] firstObject];
    return _sprintCell;
}

// caculate heigth for cell
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    QSSprintModel *model = [self.currentSprint objectAtIndex:indexPath.row];
    QSSprintCell_iPad * cell = (QSSprintCell_iPad *)[self sprintCell];
    [cell setModel:model];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1.0f;
    return height;
    //return 140;
}


// define cell in table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QSSprintCell_iPad *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSSprintCell_iPad class])];
    QSSprintModel *sprintModel = [self.currentSprint objectAtIndex:indexPath.row];
    [cell setModel:sprintModel];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    //action Sheet when tap button
    NSLog(@"index path : %d", indexPath.row);
    [cell.moreActionButton setTag: indexPath.row];
    NSLog(@"more action tag : %d",cell.moreActionButton.tag);
    [cell.moreActionButton addTarget:self
                              action:@selector(showActionSheet:)
                    forControlEvents:UIControlEventTouchUpInside];


    return cell;
}

- (void)showActionSheet:(UIButton *)sender
{
    NSLog(@"button index: %li", (long)sender.tag);
    NSString *edit= @"Edit";
    NSString *delete = @"Delete";
    NSString *cancelTitle = @"Cancel";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:edit, delete, nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet addButtonWithTitle:@"Cancel"];

    [actionSheet showInView:self.view];
}
////Action Sheets process

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@"Edit tap");
        QSAddAndEditViewController_iPad *editView = [[QSAddAndEditViewController_iPad alloc] init];
        [self.navigationController pushViewController:editView animated:YES];
    }
    else if (buttonIndex == 1){
        NSLog(@"Delete tap");
    }
    else NSLog(@"Cancel tap");
}


// get message from delegate
-(void)sendValue:(NSString *)value
{
    [self.popController dismissPopoverAnimated:YES];
    NSMutableArray * array = [NSMutableArray array];
    if ([value isEqualToString:@"1"]) {
        for (NSInteger index = 0; index < self.sprintList.count; index ++) {
            QSSprintModel * model  = [self.sprintList objectAtIndex:index];
            if ([model.status isEqualToString:@"IN PROGESS"]) {
                [array addObject:model];
            }
        }
    }else if ([value isEqualToString:@"2"]) {
        for (NSInteger index = 0; index < self.sprintList.count; index ++) {
            QSSprintModel * model  = [self.sprintList objectAtIndex:index];
            if ([model.status isEqualToString:@"IN PENDING"]) {
                [array addObject:model];
            }
        }
        
    }else if ([value isEqualToString:@"3"]) {
        for (NSInteger index = 0; index < self.sprintList.count; index ++) {
            QSSprintModel * model  = [self.sprintList objectAtIndex:index];
            if ([model.status isEqualToString:@"COMPLETE"]) {
                [array addObject:model];
            }
        }
    }else{
        array = [self.sprintList copy];
        
    }
    self.currentSprint = [array copy];
    [self.tableView reloadData];
    
}

- (IBAction)touchAddFeature:(id)sender
{
    QSAddAndEditViewController_iPad *addFeatureViewController = [[QSAddAndEditViewController_iPad alloc] init];
    addFeatureViewController.isAddFeature = YES;
    [self.navigationController pushViewController:addFeatureViewController animated:YES];
}

@end


