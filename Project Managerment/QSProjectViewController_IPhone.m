//
//  QSProjectViewController_IPhone.m
//  Project Managerment
//
//  Created by MinhTien on 6/5/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSProjectViewController_IPhone.h"
#import "QSProjectModel.h"
#import "QSProjectCell_IPhone.h"
@interface QSProjectViewController_IPhone ()

@end

@implementation QSProjectViewController_IPhone

@synthesize projectCellIPhone = _projectCellIPhone;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QSProjectCell_IPhone class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QSProjectCell_IPhone class])];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QSProjectModel *model = [self.items objectAtIndex:indexPath.row];

    QSProjectCell_IPhone *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSProjectCell_IPhone class])];
    if (!cell) {
        return nil;
    }
    [cell setModel:model];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QSProjectModel *model = [self.items objectAtIndex:indexPath.row];
    QSProjectCell_IPhone * cell = (QSProjectCell_IPhone *)self.projectCellIPhone;
    [cell setModel:model];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1.0f;
    
    return height;
}

- (QSProjectCell_IPhone *) projectCellIPhone {
    if (!_projectCellIPhone) {
        _projectCellIPhone = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([QSProjectCell_IPhone class]) owner:self options:nil] firstObject];
    }
    return _projectCellIPhone;
}

@end
