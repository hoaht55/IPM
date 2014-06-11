//
//  QSLabelTextFieldCell_iPad.h
//  Project Managerment
//
//  Created by Duong Huu Hieu on 6/11/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSLabelTextFieldCell_iPad : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *warningCase;

@end
