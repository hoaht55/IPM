//
//  UIImage+DIS.m
//  iOSUtility
//
//  Created by QuangPC on 2/19/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import "UIImage+DIS.h"

@implementation UIImage (DIS)

- (UIImage *)imageToFillSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0,0,size.width, size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)imageToFitSize:(CGSize)size {
    float max_Width = size.width;
    float max_Height = size.height;
    float actualHeight = self.size.height;
    float actualWidth = self.size.width;
    float imgRatio = actualWidth/actualHeight;
    float maxRatio = max_Width/max_Height;
    
    if (actualHeight > max_Height || actualWidth > max_Width) {
        if(imgRatio!=maxRatio){
            if(imgRatio < maxRatio){
                imgRatio = max_Height / actualHeight;
                actualWidth = imgRatio * actualWidth;
                actualHeight = max_Height;
            }else{
                imgRatio = max_Width / actualWidth;
                actualHeight = imgRatio * actualHeight;
                actualWidth = max_Width;
            }
        }else {
            actualHeight = max_Height;
            actualWidth = max_Width;
        }
        CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
        UIGraphicsBeginImageContext(rect.size);
        [self drawInRect:rect];
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
    return self;
}
@end
