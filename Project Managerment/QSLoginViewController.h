//
//  QSLoginViewController.h
//  Project Managerment
//
//  Created by Nguyen Van Quyen on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QSUserModel;
@class QSLoginService;

@interface QSLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *passLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *notificationLogin;
@property (strong, nonatomic) QSLoginService * service;
- (IBAction)loginPressed:(id)sender;
- (IBAction)AllFieldsExistedWhenEnterEmail:(id)sender;
- (IBAction)AllFieldsExistedWhenEnterPass:(id)sender;
@end
