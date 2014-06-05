//
//  QSProjectCell.m
//  Project Managerment
//
//  Created by MinhTien on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSProjectCell.h"
#import "QSProjectModel.h"
#import "QSAppPreference.h"

@implementation QSProjectCell

- (void)awakeFromNib
{
    [self.name setTextColor:[QSAppPreference blueColor]];
    [self.name setFont:[QSAppPreference boldFontWithSize:17]];
    
    [self.status setTextColor:[QSAppPreference lightGrayColor]];
    [self.status setFont:[QSAppPreference regularFontWithSize:12]];
    
    [self.desc setTextColor:[QSAppPreference dardGrayColor]];
    [self.desc setFont:[QSAppPreference regularFontWithSize:15]];
    
    [self.startDateLabel setTextColor:[QSAppPreference lightGrayColor]];
    [self.startDateLabel setFont:[QSAppPreference regularFontWithSize:11]];
    [self.startDate setTextColor:[QSAppPreference dardGrayColor]];
    [self.startDate setFont:[QSAppPreference boldFontWithSize:15]];
    
    
    [self.endDateLabel setTextColor:[QSAppPreference lightGrayColor]];
    [self.endDateLabel setFont:[QSAppPreference regularFontWithSize:11]];
    [self.endDate setTextColor:[QSAppPreference dardGrayColor]];
    [self.endDate setFont:[QSAppPreference boldFontWithSize:15]];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

- (void) setModel:(QSProjectModel *)model{
    
    _model = model;
    self.name.text = _model.name;
    self.status.text = _model.status;
    self.desc.text = _model.desc;
    self.startDate.text = _model.startDate;
    self.endDate.text = _model.endDate;
    
}
@end
