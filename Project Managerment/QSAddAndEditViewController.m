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

//- (void)addObserver;
@property (nonatomic) NSInteger *allisFilled;
- (void)keyboardDidShowOrHide:(NSNotification *)notification;
@property NSInteger allIsFilled;
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
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowOrHide:) name:UITextFieldTextDidChangeNotification object:nil];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"%d", _allIsFilled);
    [self.addAndEditTable registerNib:[UINib nibWithNibName:@"QSLabelTextFieldCell" bundle:nil] forCellReuseIdentifier:@"QSLabelTextFieldCell"];
    [self.addAndEditTable registerNib:[UINib nibWithNibName:@"QSLabelTextViewCell" bundle:nil] forCellReuseIdentifier:@"QSLabelTextViewCell"];
    [self createNavigationItem];    
    //[self addObserver];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnTableViewScreenCell:)];
    [self.addAndEditTable addGestureRecognizer:tap];

}

//- (void)addObserver
//{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowOrHide:) name:UIKeyboardDidHideNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowOrHide:) name:UIKeyboardDidShowNotification object:nil];
//    
//}
//
//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationItem
{
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    [leftButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    [rightButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightButton;
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
    
    NSString *title = @"Add Feature";
    self.navigationItem.title = title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 1) {
        return 50;
    }
    return 460;
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
            [labelTextFieldCell.inputText setTag:2];
            [labelTextFieldCell.inputText setKeyboardType:UIKeyboardTypeNumberPad];
        } else if (indexPath.row == 1) {
            [labelTextFieldCell.titleLabel setText:@"Screens"];
            [labelTextFieldCell.inputText setEnabled:NO];
        } else {
            [labelTextFieldCell.titleLabel setText:@"Manual case"];
            [labelTextFieldCell.inputText setTag:3];
            [labelTextFieldCell.inputText setKeyboardType:UIKeyboardTypeNumberPad];
        }
        return labelTextFieldCell;
    } else {
        QSLabelTextViewCell *labelTextViewCell = [self.addAndEditTable dequeueReusableCellWithIdentifier:@"QSLabelTextViewCell"];
        labelTextViewCell.textView.delegate = self;
        [labelTextViewCell.titleLabel setText:@"Description"];
        return labelTextViewCell;
    }
    return nil;
}

- (void)cancel:(id)sender
{
    [self.view endEditing:YES];
    NSLog(@"Cancel");
}

- (void)save:(id)sender
{
    NSLog(@"Save");
}

//- (void)keyboardDidShowOrHide:(NSNotification *)notification
//{
//    NSValue *keyboardFrameValue = [notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGRect keyboardFrame = keyboardFrameValue.CGRectValue;
//    CGRect viewFrame = self.view.frame;
//    CGFloat keyboardHeight = CGRectGetHeight(keyboardFrame);
//    UIScreen *mainScreen = [UIScreen mainScreen];
//    CGFloat currentScreenHeight = CGRectGetHeight(mainScreen.bounds);
//    if (Is_In_Landscape_Mode) {
//        keyboardHeight = CGRectGetWidth(keyboardFrame);
//        currentScreenHeight = CGRectGetWidth(mainScreen.bounds);
//    }
//    if ([notification.name isEqualToString:UIKeyboardDidHideNotification]) {
//        viewFrame.size.height = currentScreenHeight + keyboardHeight;
//    } else {
//        viewFrame.size.height = currentScreenHeight - keyboardHeight;
//    }
//    self.view.frame = viewFrame;
//}

-(void) didTapOnTableViewScreenCell:(UIGestureRecognizer*) recognizer {
    CGPoint tapLocation = [recognizer locationInView:self.addAndEditTable];
    NSIndexPath *indexPath = [self.addAndEditTable indexPathForRowAtPoint:tapLocation];
    
    if (indexPath.row == 1) {
        QSChooseScreenViewController *chooseScreen = [[QSChooseScreenViewController alloc] init];
        chooseScreen.delegate = self;
        [self.navigationController pushViewController:chooseScreen animated:YES];
    } else if (indexPath.row > 2) {
        NSIndexPath *indexPathScroll = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.addAndEditTable scrollToRowAtIndexPath:indexPathScroll atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"test");
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([self checkALlTextFields]) {
         [self.navigationItem.rightBarButtonItem setEnabled:YES];
    } else
         [self.navigationItem.rightBarButtonItem setEnabled:NO];
    [self checkTextField:textField];
    
}

- (BOOL)checkALlTextFields
{
     NSString * text1 = [(UITextField *)[self.view viewWithTag:1] text];
     NSString * text2 = [(UITextField *)[self.view viewWithTag:2] text];
     NSString * text3 = [(UITextField *)[self.view viewWithTag:3] text];
    if (![text1 isEqualToString:@""] && ![text2 isEqualToString:@""]&& ![text3 isEqualToString:@""]) {
        return YES;
    }
    return NO;
    
}

- (void)checkTextField:(UITextField *)textField
{
    if (_allIsFilled>=0 && _allIsFilled<=4) {
        if (![textField.text isEqualToString:@""] && _allIsFilled !=4) {
            _allIsFilled++;
        } else if (_allIsFilled != 0) {
            _allIsFilled--;
        }
    }
   
    if (_allIsFilled == 4) {
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
    } else {
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
    }
//    if ([textField.text isEqualToString:@""]) {
//        _allIsFilled--;
//        NSLog(@"%d", _allIsFilled);
//    } else if (_allIsFilled<3 && ![textField.text isEqualToString:@""]) {
//        _allIsFilled++;
//        NSLog(@"%d", _allIsFilled);
//    } else if (_allIsFilled == 3) {
//        [self.navigationItem.rightBarButtonItem setEnabled:YES];
//       NSLog(@"%d", _allIsFilled);
//    }
    NSLog(@"%d", _allIsFilled);
}

- (void)sendDataToMainScreen:(NSString *)screen
{
    NSLog(@"%@", screen);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    ((QSLabelTextFieldCell *)[self.addAndEditTable cellForRowAtIndexPath:indexPath]).inputText.text = screen;
}
@end
