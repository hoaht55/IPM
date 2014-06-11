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
#import "QSAddAndEditViewController_iPhone.h"


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
- (void)fakeModel;
- (void)filterPopover:(id)sender;
//- (void)moreAction:(id)sender;
- (void)moreActionPopover:(id)sender;

@end


@implementation QSFilterViewController_iPhone


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
    [self fakeModel];
    
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
    //[self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];
    [self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];
    }

//- (void)didSelectViewcontroller:(QSFilterTableViewController_iPhone *)controller department:(NSString *)department
//{
//    [controller dismissViewControllerAnimated:YES completion:nil];
//    self.options = department;
//}

- (void)moreActionPopover:(id)sender
{
    UIViewController *content = [[UIViewController alloc] init];
    content.view.backgroundColor = [UIColor whiteColor];
    
    QSMoreViewController_iPhone *moreViewInPop = [[QSMoreViewController_iPhone alloc] initWithNibName:NSStringFromClass([QSMoreViewController_iPhone class]) bundle:nil];
    WYPopoverController *popController = [[WYPopoverController alloc] initWithContentViewController:moreViewInPop];
    popController.popoverContentSize = CGSizeMake(300, 100);
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


// fake data
- (void)fakeModel
{
    self.listName = @[@"List staffs",@"View default role", @"List roles", @"View staff detail"];
    self.listStatus = @[@"IN PROGESS", @"IN PENDING", @"COMPLETE", @"IN PENDING"];
    self.listDesc = @[@"In oder to view all staffs on a company",
                      @"There are role were created by DIS and dealer could not edit or delete them",
                      @"In order to view all of role list for staff in one company including default roles that be created by DIS",
                      @"Apple just unveiled iOS 8 at the Developer's Conference, and it has a lot of exciting features to play around with."];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger index = 0; index < 4; index++) {
        QSSprintModel *sprintModel = [[QSSprintModel alloc] init];
        sprintModel.name = self.listName[index];
        sprintModel.status = self.listStatus[index];
        sprintModel.desc = self.listDesc[index];
        sprintModel.screen = @"4_Role";
        sprintModel.assignee = @"hungtv";
        [array addObject:sprintModel];
    }
    
    self.sprintList = [array copy];
    self.currentSprint = [array copy];
    
}

// number of cell in table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.currentSprint.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
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
    QSSprintCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSSprintCell class])];
    QSSprintModel *sprintModel = [self.currentSprint objectAtIndex:indexPath.row];
    [cell setModel:sprintModel];
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
- (IBAction)touchAddFeature:(id)sender
{
    QSAddAndEditViewController_iPhone *addFeatureViewController = [[QSAddAndEditViewController_iPhone alloc] init];
  //  [self presentViewController:[[UINavigationController alloc] initWithRootViewController:addFeatureViewController] animated:YES completion:nil];
    addFeatureViewController.isAddFeature = YES;
    [self.navigationController pushViewController:addFeatureViewController animated:YES];
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

