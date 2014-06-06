//
//  DISSendEmailUtil.m
//  iOSUtility
//
//  Created by QuangPC on 2/21/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import "DISSendEmailUtil.h"
#import <MessageUI/MessageUI.h>

@interface DISSendEmailUtil ()
<MFMailComposeViewControllerDelegate>

@end

@implementation DISSendEmailUtil

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)sendEmailWithRecipients:(NSArray *)recipients
                        subject:(NSString *)subject
                           body:(NSString *)body {
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:subject];
        NSArray *toRecipients = recipients;
        [mailer setToRecipients:toRecipients];
        NSString *emailBody = body;
        [mailer setMessageBody:emailBody isHTML:NO];
        [_parentVC presentViewController:mailer animated:YES completion:nil];
    }else {
        if (_cannotSendEmailBlock) {
            _cannotSendEmailBlock();
        }
    }
}

- (void)sendEmailWithRecipients:(NSArray *)recipients
                        subject:(NSString *)subject
                           body:(NSString *)body
                    attachImage:(UIImage *)image
                           name:(NSString *)fileName {
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:subject];
        NSArray *toRecipients = recipients;
        [mailer setToRecipients:toRecipients];
        NSString *emailBody = body;
        [mailer setMessageBody:emailBody isHTML:NO];
        NSData *imageData = UIImagePNGRepresentation(image);
        [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:fileName];
        [_parentVC presentViewController:mailer animated:YES completion:nil];
    }else {
        if (_cannotSendEmailBlock) {
            _cannotSendEmailBlock();
        }
    }
}

- (void)sendEmailWithRecipients:(NSArray *)recipients
                        subject:(NSString *)subject
                           body:(NSString *)body
                    attachedPDF:(NSData *)pdfData
                       fileName:(NSString *)fileName {
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:subject];
        NSArray *toRecipients = recipients;
        [mailer setToRecipients:toRecipients];
        NSString *emailBody = body;
        [mailer setMessageBody:emailBody isHTML:NO];
        [mailer addAttachmentData:pdfData mimeType:@"application/pdf" fileName:fileName];
        [_parentVC presentViewController:mailer animated:YES completion:nil];
    }else {
        if (_cannotSendEmailBlock) {
            _cannotSendEmailBlock();
        }
    }
}

#pragma mark - MFMail delegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            if (_cancelSendEmailBlock) {
                _cancelSendEmailBlock();
            }
            break;
        case MFMailComposeResultSaved:
            if (_saveEmailSuccessBlock) {
                _saveEmailSuccessBlock();
            }
            break;
        case MFMailComposeResultSent:
            if (_sendEmailSuccessBlock) {
                _sendEmailSuccessBlock();
            }
            break;
        case MFMailComposeResultFailed:
            if (_sendEmailFailBlock) {
                _sendEmailFailBlock();
            }
            break;
        default:
            break;
    }
    [_parentVC dismissViewControllerAnimated:YES completion:nil];
    
}

@end
