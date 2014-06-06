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

@interface QSFilterViewController_iPad ()
@property (nonatomic, strong) NSArray *sprint;

- (void)createNavigationItem;
- (void)fakeModel;
- (void)filterPopover:(id)sender;
//- (void)moreAction:(id)sender;
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
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QSSprintCell_iPad class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QSSprintCell_iPad class])];
    [self fakeModel];
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
    NSMutableArray *arrayButton = [NSMutableArray array];
    UIImage *bt_more_action = [UIImage imageNamed:@"bt_more_actions"];
    //    UIBarButtonItem *more_action = [[UIBarButtonItem alloc] initWithImage:bt_more_action landscapeImagePhone:bt_more_action style:UIBarButtonItemStylePlain target:self action:@selector(moreAction:)];
    UIBarButtonItem *more_action = [[UIBarButtonItem alloc] initWithImage:bt_more_action landscapeImagePhone:bt_more_action style:UIBarButtonItemStylePlain target:self action:@selector(moreActionPopover:)];
    
    UIImage *filterImage = [UIImage imageNamed:@"bt_sort"];
    UIBarButtonItem *righItem = [[UIBarButtonItem alloc] initWithImage:filterImage landscapeImagePhone:filterImage style:UIBarButtonItemStylePlain target:self action:@selector(filterPopover:)];
    
    [arrayButton addObject:more_action];
    [arrayButton addObject:righItem];
    
    self.navigationItem.rightBarButtonItems = arrayButton;
    
    
    // Button in the left
    UIImage *backButton = [UIImage imageNamed:@"bt_back"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:backButton landscapeImagePhone:backButton style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

//- (IBAction)filter:(id)sender)
//{
//    if (self.actionSheet){
//        //
//    }else{
//        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"View All" otherButtonTitles:@"View In Progess", nil];
//        [actionSheet showFromBarButtonItem:sender animated:YES];
//    }
//}
- (void)filterPopover:(id)sender
{
    //    if (self.popController && [self.popController isPopoverVisible]){
    //        [self.popController dismissPopoverAnimated:YES];
    //        return;
    //    }
    
    UIViewController *content = [[UIViewController alloc] init];
    content.view.backgroundColor = [UIColor whiteColor];
    
    
    //    NSString *all = @"View All";
    //    NSString *progess = @"View Progess";
    //    NSString *pending = @"View Pending";
    //    NSString *complete = @"View Complete";
    //
    //    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:all,progess,pending,complete, nil];
    //    [actionSheet showInView:content.view];
    
    QSFilterTableViewController_iPad *tableViewInPop = [[QSFilterTableViewController_iPad alloc] initWithNibName:@"QSFilterTableViewController_iPad" bundle:nil];
    
    //WYPopoverController *popController = [[WYPopoverController alloc] initWithContentViewController:content];
    WYPopoverController *popController = [[WYPopoverController alloc] initWithContentViewController:tableViewInPop];
    popController.popoverContentSize = CGSizeMake(768, 280);
    self.popController = popController;
    //[self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];
    [self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];
}


- (void)moreActionPopover:(id)sender
{
    UIViewController *content = [[UIViewController alloc] init];
    content.view.backgroundColor = [UIColor whiteColor];
    
    QSMoreViewController_iPad *moreViewInPop = [[QSMoreViewController_iPad alloc] initWithNibName:NSStringFromClass([QSMoreViewController_iPad class]) bundle:nil];
    WYPopoverController *popController = [[WYPopoverController alloc] initWithContentViewController:moreViewInPop];
    popController.popoverContentSize = CGSizeMake(768, 200);
    self.popController = popController;
    [self.popController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionDown animated:YES];
    
}


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

- (void)back:(id)sender
{
    NSLog(@"Back button touched !!");
}


- (void)fakeModel
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index++) {
        QSSprintModel *sprintModel = [[QSSprintModel alloc] init];
        sprintModel.name = [NSString stringWithFormat:@"Filter  %li", (long)index];
        sprintModel.status = @"IN PROGESS";
        sprintModel.desc = @"Apple just unveiled iOS 8 at the Developer's Conference, and it has a lot of exciting features to play around with.";
        sprintModel.screen = @"4_Role";
        sprintModel.assignee = @"hungtv";
        [array addObject:sprintModel];
    }
    self.sprint = [array copy];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sprint.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QSSprintCell_iPad *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSSprintCell_iPad class])];
    QSSprintModel *sprintModel = [self.sprint objectAtIndex:indexPath.row];
    [cell setModel:sprintModel];
    return cell;
}


@end
