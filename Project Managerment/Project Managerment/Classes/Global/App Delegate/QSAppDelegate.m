//
//  QSAppDelegate.m
//  Project Managerment
//
//  Created by Cừu Lười on 6/3/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSSprintListViewController.h"
#import "QSFilterViewController_iPhone.h"
#import "QSAppPreference.h"
#import "QSFilterViewController_iPad.h"
#import "QSAppPreference.h"
#import "QSAddAndEditViewController.h"
#import "QSAppPreference.h"
#import "QSAppDelegate.h"
#import "QSMoreViewController_iPhone.h"
#import "QSAddAndEditViewController_iPhone.h"
#import "QSAddAndEditViewController_iPad.h"
#define IS_IPAD [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad
@implementation QSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if (IS_IPAD) {
        QSFilterViewController_iPad *viewController = [[QSFilterViewController_iPad alloc] init];
        UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self.window setRootViewController:navigationController];
    } else {
        QSFilterViewController_iPhone *viewController = [[QSFilterViewController_iPhone alloc] init];
        UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];

        [self.window setRootViewController:navigationController];
    }
    
    
    [[UINavigationBar appearance] setBarTintColor:[QSAppPreference blueColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17.0], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
//
//    if (IS_IPAD) {
//        QSAddAndEditViewController_iPad *viewController = [[QSAddAndEditViewController_iPad alloc] initWithNibName:@"QSAddAndEditViewController_iPad" bundle:nil];
//        UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
//        [self.window setRootViewController:navigationController];
//    } else {
//        QSAddAndEditViewController_iPhone *viewController = [[QSAddAndEditViewController_iPhone alloc] initWithNibName:@"QSAddAndEditViewController_iPhone" bundle:nil];
//        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
//        [self.window setRootViewController:navigationController];
//    }
//    
//    [[UINavigationBar appearance] setBarTintColor:[QSAppPreference blueColor]];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[QSAppPreference boldFontWithSize:17], NSForegroundColorAttributeName:[UIColor whiteColor]}];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
   return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
