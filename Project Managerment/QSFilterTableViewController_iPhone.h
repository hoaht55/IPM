//
//  QSFilterTableViewController_iPhone.h
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/6/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QSFilterTableViewController_iPhoneDelegate <NSObject>
-(void)sendValue:(NSString *)value;
@end

@class QSFilterTableViewController_iPhone;


@interface QSFilterTableViewController_iPhone : UIViewController
@property (nonatomic,weak) id<QSFilterTableViewController_iPhoneDelegate> myDelegate;
@property (weak, nonatomic) IBOutlet UITableView *filterOptionView;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, retain) NSIndexPath *checkedIndex;
@property (nonatomic, retain) NSIndexPath *currentCheckedIndex;
@property (nonatomic, retain) NSIndexPath *lastIndex;
@property (nonatomic, retain) NSIndexPath *option;

@end

//
//// definiton of delegates's interface
//@protocol QSFilterTableViewController_iPhoneDelegate <NSObject>
//
//- (void)didSelectViewController:(QSFilterTableViewController_iPhone *)controller filterType:(NSString *)filterType;
//
//@end
