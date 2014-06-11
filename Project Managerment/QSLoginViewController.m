//
//  QSLoginViewController.m
//  Project Managerment
//
//  Created by Nguyen Van Quyen on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSLoginViewController.h"
#import "QSLoginService.h"
#import "QSUserModel.h"
#import "QSAppPreference.h"

#define MAX_LENGTH_INPUT 20
#define IS_IPAD [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad
#define IS_LANDCAPES UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
#define is4Inch  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE

@interface QSLoginViewController () <UITextFieldDelegate>
- (void)addObserver;
- (void)keyboardDidShowOrHide:(NSNotification *)notification;
@end

@implementation QSLoginViewController


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
    // Do any additional setup after loading the view.
    self.loginButton.backgroundColor = [QSAppPreference disableBlueColor];
    [self.notificationLogin setText:@""];
    [self addObserver];
    self.service = [[QSLoginService alloc]init];
}
// add observer for hide or show keyboard
- (void)addObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowOrHide:) name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShowOrHide:) name:UIKeyboardDidShowNotification object:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// enable and disable keybroad
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

// Limit length of email and password
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length == MAX_LENGTH_INPUT && range.length == 0) {
        return  FALSE;
    }
    return TRUE;
}

// Action when pressed login button
- (IBAction)loginPressed:(id)sender {
    QSUserModel * model = [[QSUserModel alloc]init];
    [model setEmail: self.emailLabel.text];
    [model setPassword:self.passLabel.text];
    if ([self.service checkEmailExists:model]) {
        if ([self.service checkLogin:model]) {
            NSLog(@"Login Sucess!");
            /* With project List View
            if(!IS_IPAD){
                QSProjectViewController_iPhone * project = [[QSProjectViewController_iPhone alloc]init];
                [self.navigationController pushViewController:project animated:YES];
            }else
            {
                QSProjectController_iPad * project = [[QSProjectViewController_iPad alloc]init];
                [self.navigationController pushViewController:project animated:YES];
            }
             */
        }else
        [self.notificationLogin setText:@"Password is wrong !"];
    }else
        [self.notificationLogin setText:@"Email does not exist !"];
}

// Check for characters exists on all textfield
- (void) WhenAllTextFieldExistOrNot
{
    if (![self.emailLabel.text isEqualToString:@""] && ![self.passLabel.text isEqualToString:@""]) {
        [self.loginButton setEnabled:YES];
        self.loginButton.backgroundColor = [QSAppPreference blueColor];
    }else
    {
        [self.loginButton setEnabled:NO];
        self.loginButton.backgroundColor = [QSAppPreference disableBlueColor];
    }
    [self.notificationLogin setText:@""];
}

- (IBAction)AllFieldsExistedWhenEnterEmail:(id)sender {
    [self WhenAllTextFieldExistOrNot];
}

- (IBAction)AllFieldsExistedWhenEnterPass:(id)sender {
    [self WhenAllTextFieldExistOrNot];
}

// Move root view for entering characters to input field
- (void)keyboardDidShowOrHide:(NSNotification *)notification
{
    CGRect frame = self.view.frame;
    if(IS_LANDCAPES){
        if ([notification.name isEqualToString:UIKeyboardDidShowNotification]){
            frame.origin.y -= 50;
           
        }else
            frame.origin.y += 50;
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = frame;
    }];
}
@end
