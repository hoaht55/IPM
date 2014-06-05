//
//  QSFeatureListViewController.m
//  Project Managerment
//
//  Created by Duong Huu Hieu on 6/4/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSFeatureListViewController.h"

@interface QSFeatureListViewController ()

- (void)createNavigationItem;

@end

@implementation QSFeatureListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createNavigationItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationItem
{
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    leftItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    NSString *title = @"Add Feature";

    self.navigationItem.title = title;
    
}

- (void)cancel:(id)sender
{
    NSLog(@"Tap here");
}

- (void)save:(id)sender
{
    NSLog(@"Save here");
}

- (void)addFeature:(id)sender
{
    NSLog(@"Add Feature");
}

@end
