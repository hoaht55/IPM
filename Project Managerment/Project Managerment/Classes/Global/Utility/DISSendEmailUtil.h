//
//  DISSendEmailUtil.h
//  iOSUtility
//
//  Created by QuangPC on 2/21/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DISSendEmailUtil : NSObject

@property (weak, nonatomic) UIViewController *parentVC;

@property (copy, nonatomic) void(^cannotSendEmailBlock)();
@property (copy, nonatomic) void(^sendEmailSuccessBlock)();
@property (copy, nonatomic) void(^cancelSendEmailBlock)();
@property (copy, nonatomic) void(^sendEmailFailBlock)();
@property (copy, nonatomic) void(^saveEmailSuccessBlock)();

- (void)sendEmailWithRecipients:(NSArray *)recipients
                        subject:(NSString *)subject
                           body:(NSString *)body;

- (void)sendEmailWithRecipients:(NSArray *)recipients
                        subject:(NSString *)subject
                           body:(NSString *)body
                    attachImage:(UIImage *)image
                           name:(NSString *)fileName;

- (void)sendEmailWithRecipients:(NSArray *)recipients
                        subject:(NSString *)subject
                           body:(NSString *)body
                    attachedPDF:(NSData *)pdfData
                       fileName:(NSString *)fileName;


@end
