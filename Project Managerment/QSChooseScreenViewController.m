//
//  QSChooseScreenViewController.m
//  Project Managerment
//
//  Created by Duong Huu Hieu on 6/5/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSChooseScreenViewController.h"
#import "QSAppPreference.h"

@interface QSChooseScreenViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic,strong) NSArray *data;

@end

@implementation QSChooseScreenViewController

@synthesize delegate;

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
                  @"1_Staff_List_Search",
                  @"2_Autumn"];
    [self.screensTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"screenCell"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnTableChooseScreen:)];
    [self.screensTable addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationItem
{
    NSString *title = @"Screens";
    self.title = title;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //self.navigationController.navigationBar.topItem.title = @"";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bt_back"] style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popViewControllerAnimated:)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize constraintSize = CGSizeMake(tableView.frame.size.width, MAXFLOAT);
    
    CGSize labelSize = [[self.data objectAtIndex:indexPath.row] sizeWithFont:[QSAppPreference italicFontWithSize:17] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByTruncatingMiddle];
    return labelSize.height + 23;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.screensTable dequeueReusableCellWithIdentifier:@"screenCell"];
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    [cell.textLabel setTextColor:[QSAppPreference dardGrayColor]];
    [cell.textLabel setNumberOfLines:0];
    [cell.textLabel setFont:[QSAppPreference regularFontWithSize:14]];
    return cell;
}

-(void) didTapOnTableChooseScreen:(UIGestureRecognizer*) recognizer {
    CGPoint tapLocation = [recognizer locationInView:self.screensTable];
    NSIndexPath *indexPath = [self.screensTable indexPathForRowAtPoint:tapLocation];
    
    [delegate sendDataToMainScreen:[self.data objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}
@end

