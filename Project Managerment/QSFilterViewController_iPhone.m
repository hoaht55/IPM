//
//  QSFilterViewController.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSFilterViewController_iPhone.h"
#import "QSSprintModel.h"
#import "QSSprintCell.h"
#import "WYPopoverController.h"
#import "WYStoryboardPopoverSegue.h"
#import "QSFilterPopoverBackground.h"
#import "QSFilterTableViewController_iPhone.h"
#import "QSMoreViewController_iPhone.h"
#import "QSFilterService.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface QSFilterViewController_iPhone () <UIPopoverControllerDelegate, QSFilterTableViewController_iPhoneDelegate>

//@property (nonatomic, weak) UIBarButtonItem *filterButton;
@property (nonatomic, strong) NSArray *sprintList;
@property (nonatomic, strong) NSArray *currentSprint;
//@property (nonatomic, strong) NSString *options;
@property (nonatomic, strong) QSFilterTableViewController_iPhone *filterView;
@property (nonatomic, strong) NSArray *listName;
@property (nonatomic, strong) NSArray *listStatus;
@property (nonatomic, strong) NSArray *listDesc;
@property (nonatomic, strong) NSArray *listScreen;
@property (nonatomic, strong) NSArray *listAssignee;


- (void)createNavigationItem;
- (void)filterPopover:(id)sender;
- (void)moreActionPopover:(id)sender;

@end


@implementation QSFilterViewController_iPhone
//@synthesize sprintCell = _sprintCell;


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
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QSSprintCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QSSprintCell class])];
    
    // comunicate by delegate
    self.filterView.myDelegate = self;
    [[self navigationController] pushViewController:self.filterView animated:YES];
    
    // add data
    self.service = [[QSFilterService alloc]init];
    self.sprintList = [[self.service getAllData] copy];
    self.currentSprint = [[self.service getAllData] copy];
    
}

- (void)createNavigationItem
{
    // Title
    NSString *title = @"Sprint 1";
    self.navigationItem.title = title;
    
    // Button in the right
    // Button for action
    NSMutableArray *arrayButton = [NSMutableArray array];
    UIImage *bt_more_action = [UIImage imageNamed:@"bt_more_actions"];
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
    
    UIViewController *content = [[UIViewController alloc] init];
    content.view.backgroundColor = [UIColor whiteColor];
    
    // create table view in popover
    QSFilterTableViewController_iPhone *tableViewInPop = [[QSFilterTableViewController_iPhone alloc] initWithNibName:@"QSFilterTableViewController_iPhone" bundle:nil];
    //self.filterView = tableViewInPop;
    
    // comuniacation by delegate
    tableViewInPop.myDelegate = self;
    
    
    // Open Filter Popover
    self.popController = [[WYPopoverController alloc] initWithContentViewController:tableViewInPop];
    self.popController.popoverContentSize = CGSizeMake(300, 180);
    [self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];
    }

- (void)moreActionPopover:(id)sender
{
    UIViewController *content = [[UIViewController alloc] init];
    content.view.backgroundColor = [UIColor whiteColor];
    
    QSMoreViewController_iPhone *moreViewInPop = [[QSMoreViewController_iPhone alloc] initWithNibName:NSStringFromClass([QSMoreViewController_iPhone class]) bundle:nil];
    WYPopoverController *popController = [[WYPopoverController alloc] initWithContentViewController:moreViewInPop];
    popController.popoverContentSize = CGSizeMake(300, 140);
    self.popController = popController;
    [self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];

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
    if (IS_IPAD) {
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        [actionSheet addButtonWithTitle:@"Cancel"];
    }
    [actionSheet showInView:self.view];
}
//Action Sheets process

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@"Edit tap");
    }
    else if (buttonIndex == 1){
        NSLog(@"Delete tap");
    }
    else NSLog(@"Cancel tap");
}


- (void)back:(id)sender
{
    NSLog(@"Back button touched !!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// number of cell in table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.currentSprint.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    QSSprintModel *model = [self.currentSprint objectAtIndex:indexPath.row];
    QSSprintCell * cell = (QSSprintCell *)[self sprintCell];
    [cell setModel:model];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    cell.bounds = CGRectMake(0.0f,0.0f, CGRectGetWidth(tableView.frame), CGRectGetHeight(cell.bounds));
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1.0f;
    return height;
    //return 140;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGSize constraintSize = CGSizeMake(tableView.frame.size.width, tableView.frame.size.height);
//    CGSize nameSize = [[self.listName objectAtIndex:indexPath.row] sizeWithFont:[UIFont boldSystemFontOfSize:17.0] constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
//    CGSize statusSize = [[self.listStatus objectAtIndex:indexPath.row] sizeWithFont:[UIFont boldSystemFontOfSize:17.0] constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
//    CGSize descSize = [[self.listDesc objectAtIndex:indexPath.row] sizeWithFont:[UIFont boldSystemFontOfSize:17.0] constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
//    return ceilf(nameSize.height + descSize.height + statusSize.height + 50);
//    
//}
// define cell in table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    QSSprintCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSSprintCell class])];
//    QSSprintModel *sprintModel = [self.currentSprint objectAtIndex:indexPath.row];
//    [cell setModel:sprintModel];
//    return cell;

    NSString *reuseIdentifier = NSStringFromClass([QSSprintCell class]);
    QSSprintCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    //QSSprintCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSSprintCell class])];
    QSSprintModel *model = [self.currentSprint objectAtIndex:indexPath.row];
    [cell setModel:model];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
    
//    if (IS_IPAD) {
//        //action Sheet when tap button
//        cell.moreAction.tag = indexPath.row;
//        [cell.moreAction addTarget:self action:@selector(showActionSheet:) forControlEvents:UIControlEventTouchUpInside];
//        return cell;
//    }
//    else{
    
        //action Sheet when tap button
        //cell.moreAction.tag = indexPath.row;
        //[cell.moreAction addTarget:self action:@selector(showActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    
    //}

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

- (QSSprintCell *) sprintCell{
    _sprintCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([QSSprintCell class]) owner:self options:nil] firstObject];
    return _sprintCell;
}

@end


//- (void)moreAction:(id)sender
//{
//    NSString *edit = @"Edit";
//    NSString *show = @"Show Detail";
//    NSString *cancel = @"Cancel";
//
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:cancel destructiveButtonTitle:nil otherButtonTitles:show,edit, nil];
//    [actionSheet showInView:self.view];
//
//}
//
//
////UIActionSheet method
//- (void)moreActionProcess:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
//    if ([buttonTitle isEqualToString:@"Edit"]){
//        NSLog(@"Edit display");
//    }
//    if([buttonTitle isEqualToString:@"Show Detail"]){
//        NSLog(@"Show detail");
//    }
//}

