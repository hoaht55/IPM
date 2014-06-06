//
//  QSMatricTitleView.m
//  IPM
//
//  Created by Socoboy on 5/20/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSMatricTitleView.h"

@interface QSMatricTitleView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *arrowButton;

- (IBAction)arrowButtonAction:(id)sender;
@end

static NSString * const ArrowDownImageName = @"arrow_title_screen_down";
static NSString * const ArrowUpImageName = @"arrow_title_screen_up";

@implementation QSMatricTitleView

- (id)init {
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([QSMatricTitleView class]) owner:nil options:nil].firstObject;
    if (self) {
        // do sth
    }
    return self;
}

- (void)awakeFromNib {
    self.titleLabel.text = @"";
    self.backgroundColor = [UIColor clearColor];
}

- (id)initWithTitle:(NSString *)title expanded:(BOOL)expanded {
    self = [self init];
    if (self) {
        self.titleString = title;
        self.isExpanded = expanded;
    }
    return self;
}

- (IBAction)arrowButtonAction:(id)sender {
    self.isExpanded = !self.isExpanded;
    if (self.matricTitleDidTapBlock) {
        self.matricTitleDidTapBlock(self);
    }
}

- (void)setTitleString:(NSString *)titleString {
    self.titleLabel.text = titleString;
}

- (NSString *)titleString {
    return self.titleLabel.text;
}

- (void)setIsExpanded:(BOOL)isExpanded {
    _isExpanded = isExpanded;
    if (_isExpanded) {
        [self.arrowButton setImage:[UIImage imageNamed:ArrowUpImageName] forState:UIControlStateNormal];
    } else {
        [self.arrowButton setImage:[UIImage imageNamed:ArrowDownImageName] forState:UIControlStateNormal];
    }
}
@end
