//
//  SBDISCPicker.h
//  SalesBox
//
//  Created by QuangPC on 4/21/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBDISCPicker : UITableViewController

@property (copy, nonatomic) void(^didSelectDISC)(NSString *nameOfDISC, UIColor *colorOfDISC);

@end
