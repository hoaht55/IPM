//
//  SBTextMenuPopOver.h
//  SalesBox
//
//  Created by QuangPC on 4/16/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBBudgetsTextMenuPopOver : UITableViewController

@property (strong, nonatomic) void(^didSelectCellAtIndex)(NSInteger index, NSString *value);
@property (nonatomic) NSInteger defaultIndexSelected;

- (void)setDataSource:(NSArray *)dataSource;

- (CGFloat)contentHeight;

@end
