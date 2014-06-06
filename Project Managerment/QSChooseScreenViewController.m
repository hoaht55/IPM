//
//  QSChooseScreenViewController.m
//  Project Managerment
//
//  Created by Duong Huu Hieu on 6/5/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSChooseScreenViewController.h"
#define IS_IPAD [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad

@interface QSChooseScreenViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic,strong) NSArray *data;

@end

@implementation QSChooseScreenViewController

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
    self.data = @[@"0_Drawer",
                  @"1_Staff_List",
                  @"1_Staff_List_Search"];
    [self.screensTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"screenCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationItem
{
    UIImage *back = [[UIImage alloc] initWithContentsOfFile:@"IMG/btn_back.png"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:back style:UIBarButtonItemStylePlain target:self action:@selector(backToAddFeature:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    NSString *title = @"Screens";
    self.navigationItem.title = title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize constraintSize = CGSizeMake(tableView.frame.size.width, MAXFLOAT);
    
    CGSize labelSize = [[self.data objectAtIndex:indexPath.row] sizeWithFont:[UIFont boldSystemFontOfSize:18.0] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByTruncatingMiddle];
    return labelSize.height + 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.screensTable dequeueReusableCellWithIdentifier:@"screenCell"];
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    [cell.textLabel setNumberOfLines:0];
    return cell;
}

- (void)backToAddFeature:(id)sender
{
    NSLog(@"Back");
}
@end

