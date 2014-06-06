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
//@interface QSFilterViewController : UIViewController <UIActionSheetDelegate>
@interface QSFilterViewController : UIViewController
@property (nonatomic, weak) UIActionSheet *actionSheet;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) WYPopoverController *popController;
//@property (nonatomic, strong) UIPopoverController *p;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end
