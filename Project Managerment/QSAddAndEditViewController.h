//
//  QSAddAndEditViewController.h
//  Project Managerment
//
//  Created by Duong Huu Hieu on 6/5/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSAddAndEditViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *addAndEditTable;
- (void)createNavigationItem;
@property (nonatomic) BOOL isAddFeature;
- (BOOL)checkAllTextFields;
- (BOOL)validateCase:(NSString *)caseString;
@end
