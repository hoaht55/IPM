//
//  QSAddAndEditViewController_iPad.m
//  Project Managerment
//
//  Created by Duong Huu Hieu on 6/11/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSAddAndEditViewController_iPad.h"
#import "QSLabelTextFieldCell_iPad.h"
#import "QSLabelTextViewCell.h"
#import "QSAppPreference.h"

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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 1) {
        QSLabelTextFieldCell_iPad *labelTextFieldCell = [self.addAndEditTable dequeueReusableCellWithIdentifier:@"QSLabelTextFieldCell_iPad"];
      //  labelTextFieldCell.inputText.delegate = self;
        if (indexPath.row == 0) {
            [labelTextFieldCell.titleLabel setText:@"Name"];
            [labelTextFieldCell.inputText setTag:1];
        } else if (indexPath.row == 2) {
            [labelTextFieldCell.titleLabel setText:@"Auto case"];
            [labelTextFieldCell.inputText setTag:3];
           // [labelTextFieldCell.warningCase setText:@"Must be numbers"];
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
    //    labelTextViewCell.textView.delegate = self;
        [labelTextViewCell.titleLabel setText:@"Description"];
        return labelTextViewCell;
    }
    return nil;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}



@end
