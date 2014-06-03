//
//  NSAttributedString+DIS.h
//  iOSUtility
//
//  Created by QuangPC on 2/20/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (DIS)

- (CGFloat)boundingHeightForFixedWidth:(CGFloat)width;

- (CGRect)boundingRectForWidth:(CGFloat)width;

@end
