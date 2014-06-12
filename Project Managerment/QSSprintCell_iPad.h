//
//  QSSprintCell_iPad.h
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/6/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QSSprintModel.h"

@interface QSSprintCell_iPad : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenLabel;
@property (weak, nonatomic) IBOutlet UILabel *assigneeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreActionButton;

@property (nonatomic, strong) QSSprintModel *sprintModel;

- (void)setModel:(QSSprintModel *)sprintModel;
@end
