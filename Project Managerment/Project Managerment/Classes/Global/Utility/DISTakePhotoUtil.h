//
//  DISTakePhotoUtil.h
//  iOSUtility
//
//  Created by QuangPC on 2/21/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DISTakePhotoUtil : NSObject
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) UIViewController *parentVC;

@property (nonatomic, copy) void(^finishPickingPhotoBlock)(UIImage *pickedImage);

@property (nonatomic, copy) void(^cancelPickingPhotoBlock)();

@property (nonatomic, copy) void(^cannotPickingPhotoBlock)();

- (void)takePhotoFromCamera;

- (void)takePhotoFromGallery;


@end
