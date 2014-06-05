//
//  QSProjectViewController.h
//  Project Managerment
//
//  Created by MinhTien on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QSProjectCell.h"
@interface QSProjectViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) QSProjectCell *projectCell;

@end
