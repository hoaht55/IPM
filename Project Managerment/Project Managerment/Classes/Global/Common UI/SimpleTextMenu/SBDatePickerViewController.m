//
//  SBDatePickerViewController.m
//  SalesBox
//
//  Created by QuangPC on 4/17/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import "SBDatePickerViewController.h"
#import "QSAppPreference.h"

static CGFloat kHeight_DatePicker = 202;

@interface SBDatePickerViewController ()
@property (strong, nonatomic) NSDate *tempDate;
@end

@implementation SBDatePickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.datePickerMode = UIDatePickerModeDate;
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _tempDate = [NSDate date];
        self.datePickerMode = UIDatePickerModeDate;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createNavigationItems];
    [self createUI];
}
- (void)createNavigationItems {
    // create done button
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonPressed:)];
    doneButton.tintColor = [QSAppPreference blueColor];
    self.navigationItem.rightBarButtonItem = doneButton;
    UIBarButtonItem *clearButton = [[UIBarButtonItem alloc] initWithTitle:@"Clear" style:UIBarButtonItemStylePlain target:self action:@selector(clearButtonPressed:)];
    clearButton.tintColor = [QSAppPreference blueColor];
    self.navigationItem.leftBarButtonItem = clearButton;
}
- (void)createUI {
    // add date picker
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), kHeight_DatePicker)];
    self.datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    if (self.datePickerMode != UIDatePickerModeDate) {
        self.datePicker.datePickerMode = self.datePickerMode;
    }

    self.datePicker.date = _tempDate;
    [self.view addSubview:self.datePicker];
}
#pragma mark - Actions
- (void)doneButtonPressed:(id)sender {
    if (self.finishPickingDate) {
        self.finishPickingDate(self.datePicker.date);
    }
}
- (void)clearButtonPressed:(id)sender {
    if (self.clearDate) {
        self.clearDate();
    }
}
- (void)setDate:(NSDate *)date {
    _tempDate = date;
    _datePicker.date = _tempDate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
