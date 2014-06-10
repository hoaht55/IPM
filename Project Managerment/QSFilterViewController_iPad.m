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

@interface QSFilterViewController_iPad () <QSFilterTableViewController_iPadDelegate>

@property (nonatomic, strong) NSArray *sprintList;
@property (nonatomic, strong) NSArray *currentSprint;
@property (nonatomic, strong) QSFilterTableViewController_iPad *filterView;


- (void)createNavigationItem;
- (void)fakeModel;
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
    QSFilterTableViewController_iPad *tableViewInPop = [[QSFilterTableViewController_iPad alloc] initWithNibName:NSStringFromClass([QSFilterTableViewController_iPad class]) bundle:nil];
    //self.filterView = tableViewInPop;
    
    // comuniacation by delegate
    tableViewInPop.myDelegate = self;
    
    
    // Open Filter Popover
    self.popController = [[WYPopoverController alloc] initWithContentViewController:tableViewInPop];
    self.popController.popoverContentSize = CGSizeMake(768, 290);
    
    [self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];
}

- (void)moreActionPopover:(id)sender
{
    UIViewController *content = [[UIViewController alloc] init];
    content.view.backgroundColor = [UIColor whiteColor];
    
    QSMoreViewController_iPad *moreViewInPop = [[QSMoreViewController_iPad alloc] initWithNibName:NSStringFromClass([QSMoreViewController_iPad class]) bundle:nil];
    WYPopoverController *popController = [[WYPopoverController alloc] initWithContentViewController:moreViewInPop];
    popController.popoverContentSize = CGSizeMake(768, 160);
    self.popController = popController;
    [self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];
    
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
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger index = 0; index < 4; index++) {
        QSSprintModel *sprintModel = [[QSSprintModel alloc] init];
        sprintModel.name = [NSString stringWithFormat:@"Filter %li", (long)index];
        sprintModel.status = @"IN PENDING";
        sprintModel.desc = @"Apple just unveiled iOS 8 at the Developer's Conference, and it has a lot of exciting features to play around with.";
        sprintModel.screen = @"4_Role";
        sprintModel.assignee = @"hungtv";
        [array addObject:sprintModel];
    }
    QSSprintModel * model = [[QSSprintModel alloc]init];
    model.name = @"Sale Box";
    model.status = @"IN PROGESS";
    model.desc = @"Information about Salebox";
    model.screen = @"screen";
    model.assignee =@"assignee";
    [array addObject:model];
    
    QSSprintModel * model1 = [[QSSprintModel alloc]init];
    model1.name = @"List Staff";
    model1.status = @"COMPLETE";
    model1.desc = @"View all staff";
    model1.screen = @"1_Staff_List";
    model1.assignee =@"abc";
    [array addObject:model1];
    
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
    return 180;
}

// define cell in table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QSSprintCell_iPad *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSSprintCell_iPad class])];
    QSSprintModel *sprintModel = [self.currentSprint objectAtIndex:indexPath.row];
    [cell setModel:sprintModel];
    return cell;
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


