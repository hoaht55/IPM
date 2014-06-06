//
//  SBTextMenuPopOver.h
//  SalesBox
//
//  Created by QuangPC on 4/16/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBTextMenuPopOver : UITableViewController

@property (strong, nonatomic) void(^didSelectCellAtIndex)(NSInteger index, NSString *value);
@property (copy, nonatomic) NSIndexPath *selectedIndex;
@property (assign, nonatomic) BOOL notShowCheckmark;
- (void)setDataSource:(NSArray *)dataSource;
- (NSArray*)getDataSource;
- (void)setSelectedIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)contentHeight;

@end
