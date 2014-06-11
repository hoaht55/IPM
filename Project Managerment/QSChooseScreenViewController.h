//
//  QSChooseScreenViewController.h
//  Project Managerment
//
//  Created by Duong Huu Hieu on 6/5/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol chooseScreenDelegate <NSObject>

- (void)sendDataToMainScreen:(NSString *)screen;

@end
@interface QSChooseScreenViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *screensTable;
@property (nonatomic, assign) id delegate;

- (void)createNavigationItem;

@end
