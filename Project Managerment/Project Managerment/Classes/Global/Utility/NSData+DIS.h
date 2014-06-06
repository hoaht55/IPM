//
//  NSData+DIS.h
//  iOSUtility
//
//  Created by QuangPC on 2/21/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DIS)

+ (NSData *)base64DataFromString:(NSString *)string;

@end

@interface NSData (SHA1)

- (NSString *)SHA1String;

@end
