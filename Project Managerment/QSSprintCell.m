//
//  QSSprintCell.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSSprintCell.h"
#import "QSSprintModel.h"

@implementation QSSprintCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(QSSprintModel *)sprintModel
{
    _sprintModel = sprintModel;
    [self.nameLabel setText:_sprintModel.name];
    [self.statusLabel setText:_sprintModel.status];
    [self.descLabel setText:_sprintModel.desc];
    [self.screenLabel setText:_sprintModel.screen];
    [self.assigneeLabel setText:_sprintModel.assignee];
}


- (IBAction)moreAction:(id)sender {
    
}
@end
