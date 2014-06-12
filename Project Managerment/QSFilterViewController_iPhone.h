//
//  QSFilterViewController.h
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYPopoverController.h"
#import "WYStoryboardPopoverSegue.h"
#import "QSFilterPopoverTableViewController_iPhone.h"
#import "QSFilterTableViewController_iPhone.h"
#import "QSFilterService.h"
#import "QSSprintCell.h"
#import "QSFilterService.h"
//@interface QSFilterViewController : UIViewController <UIActionSheetDelegate>
@interface QSFilterViewController_iPhone : UIViewController
//<QSFilterTableViewController_iPhoneDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) WYPopoverController *popController;

- (IBAction)touchAddFeature:(id)sender;

@property (nonatomic, strong) NSIndexPath *lastIndex;
@property (nonatomic, strong) QSSprintCell *sprintCell;
@property (nonatomic, strong)QSFilterService *service;
@end
