//
//  QSAddAndEditViewController.m
//  Project Managerment
//
//  Created by Duong Huu Hieu on 6/5/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSAddAndEditViewController.h"
#import "QSChooseScreenViewController.h"
#import "QSLabelTextFieldCell.h"
#import "QSLabelTextViewCell.h"
#import "QSAppPreference.h"

@interface QSAddAndEditViewController () <UITextViewDelegate, UITextFieldDelegate>

- (void)addObserver;
//- (void)keyboardDidShowOrHide:(NSNotification *)notification;
@end

@implementation QSAddAndEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.addAndEditTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowOrHide:) name:UITextFieldTextDidChangeNotification object:nil];
    // Do any additional setup after loading the view from its nib.
    [self.addAndEditTable registerNib:[UINib nibWithNibName:@"QSLabelTextFieldCell" bundle:nil] forCellReuseIdentifier:@"QSLabelTextFieldCell"];
    [self.addAndEditTable registerNib:[UINib nibWithNibName:@"QSLabelTextViewCell" bundle:nil] forCellReuseIdentifier:@"QSLabelTextViewCell"];
    [self createNavigationItem];
    [self addObserver];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnTableViewScreenCell:)];
    [self.addAndEditTable addGestureRecognizer:tap];

}

- (void)addObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowOrHide:) name:UIKeyboardDidHideNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowOrHide:) name:UIKeyboardDidShowNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationItem
{
    if (_isAddFeature) {
        [self.navigationItem setTitle:@"Add Feature"];
    } else {
        [self.navigationItem setTitle:@"Edit"];
    }
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    [leftButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    [rightButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightButton;
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 1) {
        return 44;
    }
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 1) {
        QSLabelTextFieldCell *labelTextFieldCell = [self.addAndEditTable dequeueReusableCellWithIdentifier:@"QSLabelTextFieldCell"];
        labelTextFieldCell.inputText.delegate = self;
        if (indexPath.row == 0) {
            [labelTextFieldCell.titleLabel setText:@"Name"];
            [labelTextFieldCell.inputText setTag:1];
        } else if (indexPath.row == 2) {
            [labelTextFieldCell.titleLabel setText:@"Auto case"];
            [labelTextFieldCell.inputText setTag:3];
            [labelTextFieldCell.inputText setKeyboardType:UIKeyboardTypeNumberPad];
        } else if (indexPath.row == 1) {
            [labelTextFieldCell.titleLabel setText:@"Screens"];
            [labelTextFieldCell.inputText setTag:2];
            [labelTextFieldCell.inputText setEnabled:NO];
        } else {
            [labelTextFieldCell.titleLabel setText:@"Manual case"];
            [labelTextFieldCell.inputText setTag:4];
            [labelTextFieldCell.inputText setKeyboardType:UIKeyboardTypeNumberPad];
        }
        return labelTextFieldCell;
    } else {
        QSLabelTextViewCell *labelTextViewCell = [self.addAndEditTable dequeueReusableCellWithIdentifier:@"QSLabelTextViewCell"];
        [labelTextViewCell.textView setTag:5];
        labelTextViewCell.textView.delegate = self;
        [labelTextViewCell.titleLabel setText:@"Description"];
        return labelTextViewCell;
    }
    return nil;
}

- (void)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    // [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)save:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)keyboardDidShowOrHide:(NSNotification *)notification
//{
//    NSValue *keyboardFrameValue = [notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGRect keyboardFrame = keyboardFrameValue.CGRectValue;
//    CGRect viewFrame = self.view.frame;
//    CGRect tableFrame = self.addAndEditTable.frame;
//    CGFloat keyboardHeight = CGRectGetHeight(keyboardFrame);
//    UIScreen *mainScreen = [UIScreen mainScreen];
//    CGFloat currentScreenHeight = CGRectGetHeight(mainScreen.bounds);
//    if (Is_In_Landscape_Mode) {
//        keyboardHeight = CGRectGetWidth(keyboardFrame);
//        currentScreenHeight = CGRectGetWidth(mainScreen.bounds);
//    }
//    if ([notification.name isEqualToString:UIKeyboardDidHideNotification]) {
//        viewFrame.size.height = currentScreenHeight + keyboardHeight;
//        tableFrame.origin.x = tableFrame.origin.x + keyboardHeight;
//    } else {
//        viewFrame.size.height = currentScreenHeight - keyboardHeight;
//         tableFrame.origin.x = tableFrame.origin.x - keyboardHeight;
//    }
//    self.view.frame = viewFrame;
//    self.addAndEditTable.frame = tableFrame;
//}

- (void) didTapOnTableViewScreenCell:(UIGestureRecognizer*) recognizer {
    CGPoint tapLocation = [recognizer locationInView:self.addAndEditTable];
    NSIndexPath *indexPath = [self.addAndEditTable indexPathForRowAtPoint:tapLocation];
    
    if (indexPath.row == 1) {
        QSChooseScreenViewController *chooseScreen = [[QSChooseScreenViewController alloc] init];
        chooseScreen.delegate = self;
        [self.navigationController pushViewController:chooseScreen animated:YES];
    }
    self.addAndEditTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)textViewDidChange:(UITextView *)textView
{
    if ([self checkAllTextFields]) {
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
    } else
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
}

- (void)textFieldDidChange:(NSNotification *)notification
{
    if ([self checkAllTextFields]) {
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
    } else
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
}

- (BOOL)checkAllTextFields
{
    NSString * name = [(UITextField *)[self.view viewWithTag:1] text];
    NSString * screen = [(UITextField *)[self.view viewWithTag:2] text];
    NSString * autoCase = [(UITextField *)[self.view viewWithTag:3] text];
    NSString * manualCase = [(UITextField *)[self.view viewWithTag:4] text];
    NSString * description = [(UITextView *)[self.view viewWithTag:5] text];
    
    if (![self validateCase:autoCase] || ![self validateCase:manualCase]) {
        return NO;
    }
    if (![name isEqualToString:@""] && ![screen isEqualToString:@""] && ![autoCase isEqualToString:@""]
        && ![manualCase isEqualToString:@""] && ![description isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

- (void)sendDataToMainScreen:(NSString *)screen
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    ((QSLabelTextFieldCell *)[self.addAndEditTable cellForRowAtIndexPath:indexPath]).inputText.text = screen;
    if ([self checkAllTextFields]) {
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
    } else
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    UITableViewCell *cell = (UITableViewCell *) textField.superview.superview.superview;
    [self.addAndEditTable scrollToRowAtIndexPath:[self.addAndEditTable indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void) textViewDidBeginEditing:(UITextView *)textView
{
    UITableViewCell *cell = (UITableViewCell *) textView.superview.superview.superview;
    [self.addAndEditTable scrollToRowAtIndexPath:[self.addAndEditTable indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

- (BOOL)validateCase:(NSString *)caseString
{
    NSString *regExPattern = @"^\[0-9]{1,50}$";
    
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:caseString options:0 range:NSMakeRange(0, [caseString length])];
    
    if (regExMatches == 0) {
        return NO;
    } else {
        return YES;
    }
}
@end
