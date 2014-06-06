//
//  QSFilterTableViewController_iPhone.h
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/6/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSFilterTableViewController_iPhone : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *filterOptionView;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, retain) NSIndexPath *checkedIndex;
@property (nonatomic, retain) NSIndexPath *option;
@end
