//
//  MBProgressHUD+Category.m
//  IPM
//
//  Created by Cừu Lười on 5/21/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "MBProgressHUD+Category.h"

@implementation MBProgressHUD (Category)

+ (instancetype)showSmallIndicatiorInView:(UIView *)view
{
    MBProgressHUD *hud;
    hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setMode:MBProgressHUDModeCustomView];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicator startAnimating];
    [indicator setFrame:CGRectMake(0, 0, kIndicatorSize, kIndicatorSize)];
    [hud setCustomView:indicator];
    hud.margin = 5.0;
    return hud;
}


@end
CGFloat kIndicatorSize = 40.0;