//
//  SBDatePickerViewController.h
//  SalesBox
//
//  Created by QuangPC on 4/17/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBDatePickerViewController : UIViewController
@property (copy, nonatomic) void(^clearDate)();
@property (copy, nonatomic) void(^finishPickingDate)(NSDate *pickedDate);
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (nonatomic) UIDatePickerMode datePickerMode;

- (void)setDate:(NSDate *)date;

@end
