//
//  QSSprintCell.h
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QSSprintModel.h"

@interface QSSprintCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenLabel;
@property (weak, nonatomic) IBOutlet UILabel *assigneeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreActionButton;


@property (strong, nonatomic) UIActionSheet *actionSheet;
@property (nonatomic, strong) NSString *actionSheetOptions;



@property (nonatomic, strong) QSSprintModel *sprintModel;

- (void)setModel:(QSSprintModel *)sprintModel;
//- (IBAction)moreAction:(id)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end
