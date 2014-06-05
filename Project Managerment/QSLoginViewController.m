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
//define max of length's email and password
#define MAX_LENGTH_INPUT 20

@interface QSLoginViewController () <UITextFieldDelegate>

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

- (void) checkTextField
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
- (IBAction)checkEmailState:(id)sender {
    [self checkTextField];
}

- (IBAction)checkPassState:(id)sender {
    [self checkTextField];
}

// Check login
- (BOOL)checkLogin
{
    QSLoginService * service = [[QSLoginService alloc]init];
    QSUserModel * model = [[QSUserModel alloc]init];
    [model setEmail: self.emailLabel.text];
    [model setPassword:self.passLabel.text];
    return [service checkkLogin:model];
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
    if ([self checkLogin]) {
        NSLog(@"Login Success");
    }else
        [self.notificationLogin setText:@"Email or password is wrong !"];
}
@end
