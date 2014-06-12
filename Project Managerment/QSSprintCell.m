//
//  QSSprintCell.m
//  Project Managerment
//
//  Created by Mai Viet Anh on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSSprintCell.h"
#import "QSSprintModel.h"
#import "QSAddAndEditViewController.h"

@implementation QSSprintCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(QSSprintModel *)sprintModel
{
    _sprintModel = sprintModel;
    [self.nameLabel setText:_sprintModel.name];
    [self.statusLabel setText:_sprintModel.status];
    [self.descLabel setText:_sprintModel.desc];
    [self.screenLabel setText:_sprintModel.screen];
    [self.assigneeLabel setText:_sprintModel.assignee];
}


//- (IBAction)moreAction:(id)sender {
//    NSString *edit= @"Edit";
//    NSString *delete = @"Delete";
//    NSString *cancelTitle = @"Cancel";
//    
//    self.actionSheet = [[UIActionSheet alloc]
//                                  initWithTitle:nil
//                                  delegate:self
//                                  cancelButtonTitle:cancelTitle
//                                  destructiveButtonTitle:nil
//                                  otherButtonTitles:edit, delete, nil];
//
//    [self.actionSheet showFromRect:self.moreAction.frame inView:self animated:YES];
//}
//
//- (void)showActionSheet:(UIButton *)sender
//{
//    NSLog(@"button index: %li", (long)sender.tag);
//    
//}
////Action Sheets process
//
//-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex == 0) {
//        NSLog(@"Edit tap");
//    }
//    else if (buttonIndex == 1){
//        NSLog(@"Delete tap");
//    }
//    else NSLog(@"Cancel tap");
//}

@end
