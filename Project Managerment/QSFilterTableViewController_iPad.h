//
//  QSFilterTableViewController_iPad.h
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/6/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QSFilterTableViewController_iPadDelegate <NSObject>
- (void)sendValue:(NSString *)value;
@end

@class QSFilterTableViewController_iPad;


@interface QSFilterTableViewController_iPad : UIViewController
@property (nonatomic,weak) id<QSFilterTableViewController_iPadDelegate> myDelegate;

@property (weak, nonatomic) IBOutlet UITableView *filterOptionView;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, retain) NSIndexPath *checkedIndex;
@property (nonatomic, retain) NSIndexPath *option;

@end