//
//  QSFilterViewController_iPad.h
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/6/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYPopoverController.h"
#import "WYStoryboardPopoverSegue.h"
#import "QSFilterTableViewController_iPad.h"
#import "QSFilterService.h"
#import "QSSprintModel.h"
#import "QSSprintCell_iPad.h"

@interface QSFilterViewController_iPad : UIViewController
@property (nonatomic, strong) WYPopoverController *popController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) QSFilterService *service;
@property (strong, nonatomic) QSSprintCell_iPad *sprintCell;

- (IBAction)touchAddFeature:(id)sender;


@end
