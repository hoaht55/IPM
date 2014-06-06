//
//  SBDISCPicker.m
//  SalesBox
//
//  Created by QuangPC on 4/21/14.
//  Copyright (c) 2014 salesbox. All rights reserved.
//

#import "SBDISCPicker.h"

@interface SBDISCPicker ()
@property (strong, nonatomic) NSArray *listOfDISC;
@property (strong, nonatomic) NSArray *colorList;
@end

#define SBDISC_BlueColor [UIColor colorWithRed:30.0/255 green:144.0/255 blue:240.0/255 alpha:1]
#define SBDISC_GreenColor [UIColor colorWithRed:76.0/255 green:216.0/255 blue:100.0/255 alpha:1]
#define SBDISC_RedColor [UIColor colorWithRed:252.0/255 green:58.0/255 blue:58.0/255 alpha:1]
#define SBDISC_YellowColor [UIColor colorWithRed:230.0/255 green:222.0/255 blue:2.0/255 alpha:1]
#define SBBlackColor [UIColor blackColor]
#define SBFontRegular(v) [UIFont fontWithName:@"OpenSans" size:v]

static NSInteger kTag_ColorView = 69;
static NSInteger kTag_ColorLabel = 96;

@implementation SBDISCPicker

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _listOfDISC = @[@"-----", @"blue", @"green", @"red", @"yellow"];
    
    UIColor *blueColor = SBDISC_BlueColor;
    UIColor *greenColor = SBDISC_GreenColor;
    UIColor *yellowColor = SBDISC_YellowColor;
    UIColor *redColor = SBDISC_RedColor;
    
    _colorList = @[blueColor, greenColor, redColor, yellowColor];
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _listOfDISC.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *DISCCell = @"DISCCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DISCCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DISCCell];
        UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(10, 7, 30, 30)];
        colorView.backgroundColor = [UIColor clearColor];
        colorView.tag = kTag_ColorView;
        [cell.contentView addSubview:colorView];
        
        UILabel *colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 200, 44)];
        colorLabel.textColor = SBBlackColor;
        colorLabel.font = SBFontRegular(14);
        colorLabel.tag = kTag_ColorLabel;
        [cell.contentView addSubview:colorLabel];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    // Configure the cell...
    UIView *colorView = [cell.contentView viewWithTag:kTag_ColorView];
    if (colorView) {
        if (indexPath.row == 0) {
            colorView.backgroundColor = [UIColor clearColor];
        } else {
            colorView.backgroundColor = [_colorList objectAtIndex:(indexPath.row - 1)];
        }
    }
    UILabel *colorLabel = (UILabel *)[cell.contentView viewWithTag:kTag_ColorLabel];
    if (colorLabel) {
        colorLabel.text = [_listOfDISC objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *discName = [_listOfDISC objectAtIndex:indexPath.row];
    UIColor *discColor = nil;
    if (indexPath.row) {
        discColor = [_colorList objectAtIndex:indexPath.row - 1];
    }
    if (_didSelectDISC) {
        _didSelectDISC(discName, discColor);
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
