//
//  QSStatusControl.m
//  IPM
//
//  Created by Cừu Lười on 5/21/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSStatusControl.h"
#import "QSAppPreference.h"

@interface QSStatusControl()

- (void)loadViewFromNib;

@end

@implementation QSStatusControl

- (void)loadViewFromNib
{
    self.contentView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    self.contentView.frame = self.bounds;
    [self addSubview:self.contentView];
    
    self.textLabel.textColor = [QSAppPreference lightGrayColor];
    self.textLabel.font = [QSAppPreference regularFontWithSize:12.0];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadViewFromNib];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self loadViewFromNib];
    }
    return self;
}



@end
