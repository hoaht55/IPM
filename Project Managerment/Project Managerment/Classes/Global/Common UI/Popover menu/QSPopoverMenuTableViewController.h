//
//  QSPopoverMenuTableViewController.h
//  IPM
//
//  Created by Socoboy on 5/20/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSPopoverMenuTableViewController : UITableViewController
@property (nonatomic, copy, readwrite) void(^didSelectRow)(NSInteger row);
@property (nonatomic, copy) NSArray *datasource;
@property (nonatomic) BOOL showCheck;
@property (nonatomic) NSInteger checkedRow;
@property (nonatomic, readonly) CGFloat fitableHeight;
@end
