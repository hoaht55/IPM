//
//  DISSendSMSUtil.m
//  iOSUtility
//
//  Created by QuangPC on 2/21/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import "DISSendSMSUtil.h"

@implementation DISSendSMSUtil

- (void)sendSMSWithRecipients:(NSArray *)recipients body:(NSString *)body {
    if([MFMessageComposeViewController canSendText]) {
        NSArray *recipents = recipients;
        NSString *message = body;
        
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        messageController.messageComposeDelegate = self;
        [messageController setRecipients:recipents];
        [messageController setBody:message];
        
        // Present message view controller on screen
        [_parentVC presentViewController:messageController animated:YES completion:nil];
    } else {
        if (_cannotSendSMS) {
            _cannotSendSMS();
        }
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
        {
            if (_cancelSendSmsBlock) {
                _cancelSendSmsBlock();
            }
            break;
        }
        
        case MessageComposeResultFailed:
        {
            if (_sendSMSFailBlock) {
                _sendSMSFailBlock();
            }
            break;
        }
            
        case MessageComposeResultSent:
        {
            if (_sendSMSSuccessBlock) {
                _sendSMSSuccessBlock();
            }
            break;
        }
        default:
            break;
    }
    
    [_parentVC dismissViewControllerAnimated:YES completion:nil];
}
@end
