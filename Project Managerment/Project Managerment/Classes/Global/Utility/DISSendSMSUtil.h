//
//  DISSendSMSUtil.h
//  iOSUtility
//
//  Created by QuangPC on 2/21/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@interface DISSendSMSUtil : NSObject
<MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) UIViewController *parentVC;

@property (copy, nonatomic) void(^cannotSendSMS)();
@property (copy, nonatomic) void(^sendSMSFailBlock)();
@property (copy, nonatomic) void(^sendSMSSuccessBlock)();
@property (copy, nonatomic) void(^cancelSendSmsBlock)();

/**
 *  Send sms
 *
 *  @param recipients phone number list
 *  @param body       body of sms msg
 */
- (void)sendSMSWithRecipients:(NSArray *)recipients body:(NSString *)body;

@end
