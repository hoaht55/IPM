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

@interface QSAddAndEditViewController () <UITextViewDelegate>

//- (void)addObserver;


- (void)keyboardDidShowOrHide:(NSNotification *)notification;

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
    // Do any additional setup after loading the view from its nib.
    [self.addAndEditTable registerNib:[UINib nibWithNibName:@"QSLabelTextFieldCell" bundle:nil] forCellReuseIdentifier:@"QSLabelTextFieldCell"];
    [self.addAndEditTable registerNib:[UINib nibWithNibName:@"QSLabelLabelCell" bundle:nil] forCellReuseIdentifier:@"QSLabelLabelCell"];
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
    [self.navigationItem.rightBarButtonItem setEnabled:YES];
    
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
                    } else if (indexPath.row == 2) {
            [labelTextFieldCell.titleLabel setText:@"Auto case"];
            [labelTextFieldCell.inputText setKeyboardType:UIKeyboardTypeNumberPad];
        } else if (indexPath.row == 1) {
            [labelTextFieldCell.titleLabel setText:@"Screens"];
            [labelTextFieldCell.inputText setEnabled:NO];
        } else {
            [labelTextFieldCell.titleLabel setText:@"Manual case"];
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
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField.text isEqualToString:@""])
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
}

@end
