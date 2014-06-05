//
//  QSAppDelegate.m
//  Project Managerment
//
//  Created by Cừu Lười on 6/3/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSAppDelegate.h"
#import "QSProjectViewController_IPhone.h"
#import "QSProjectViewController_IPad.h"
#import "QSAppPreference.h"

#define IS_IPAD [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad

@implementation QSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if(IS_IPAD){
        NSLog(@"IPad");
        QSProjectViewController_IPad * ipadViewController = [[QSProjectViewController_IPad alloc] initWithNibName:NSStringFromClass([QSProjectViewController_IPad class]) bundle:nil];
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:ipadViewController];
        
            [[UINavigationBar appearance] setBarTintColor:[QSAppPreference blueColor]];

        self.window.rootViewController = navigationController;
    }
    else{
        NSLog(@"IPhone");
        QSProjectViewController_IPhone *iphoneViewController = [[QSProjectViewController_IPhone alloc] initWithNibName:NSStringFromClass([QSProjectViewController_IPhone class]) bundle:nil];
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:iphoneViewController];
        
        self.window.rootViewController = navigationController;
        
        [[UINavigationBar appearance] setBarTintColor:[QSAppPreference blueColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{
                    NSForegroundColorAttributeName : [UIColor redColor],
                    NSFontAttributeName            : [UIFont systemFontOfSize:14],
        }];
        
//        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Projects" style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonBack:)];
    }
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) backButtonBack: (id) sender{
    NSLog(@"Back button Touched");
}
@end
