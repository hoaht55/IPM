//
//  DISTakePhotoUtil.m
//  iOSUtility
//
//  Created by QuangPC on 2/21/14.
//  Copyright (c) 2014 DIS. All rights reserved.
//

#import "DISTakePhotoUtil.h"

@implementation DISTakePhotoUtil

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)takePhotoFromCamera {
    [self getMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}

- (void)takePhotoFromGallery {
    [self getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType {
    NSArray *mediaTypes = [UIImagePickerController
                           availableMediaTypesForSourceType:sourceType];
    if ([UIImagePickerController isSourceTypeAvailable:sourceType] && [mediaTypes count] > 0) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.sourceType = sourceType;
        [_parentVC presentViewController:picker animated:YES completion:nil];
    } else {
        if (_cannotPickingPhotoBlock) {
            _cannotPickingPhotoBlock();
        }
    }
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage * pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (_finishPickingPhotoBlock) {
        _finishPickingPhotoBlock(pickedImage);
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (_cancelPickingPhotoBlock) {
        _cancelPickingPhotoBlock();
    }
}

@end
