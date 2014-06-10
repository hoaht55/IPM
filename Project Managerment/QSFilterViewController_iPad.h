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

@interface QSFilterViewController_iPad : UIViewController
@property (nonatomic, strong) WYPopoverController *popController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
