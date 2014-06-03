//
//  QSMatricTitleView.h
//  IPM
//
//  Created by Socoboy on 5/20/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSMatricTitleView : UIView

@property (nonatomic, copy) NSString *titleString;
@property (nonatomic) BOOL isExpanded;
@property (nonatomic, copy, readwrite) void(^matricTitleDidTapBlock)(QSMatricTitleView *sender);

- (id)initWithTitle:(NSString *)title expanded:(BOOL)expanded;
- (IBAction)arrowButtonAction:(id)sender;

@end
