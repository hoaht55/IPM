//
//  QSAddAndEditViewController_iPad.m
//  Project Managerment
//
//  Created by Duong Huu Hieu on 6/11/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSAddAndEditViewController_iPad.h"

@interface QSAddAndEditViewController_iPad ()

@end

@implementation QSAddAndEditViewController_iPad

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
    [self validateCase:@"4765635gfdg35"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 1) {
        return 44;
    }
    return 350;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (([textField tag] == 3 || [textField tag] == 4) && ![textField.text isEqualToString:@""]) {
        if (![self validateCase:textField.text]) {
            NSLog(@"Ok men");
        }
    }
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
