//
//  QSProjectViewController_IPad.m
//  Project Managerment
//
//  Created by MinhTien on 6/5/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSProjectViewController_IPad.h"
#import "QSProjectModel.h"
#import "QSProjectCell_IPad.h"

@interface QSProjectViewController_IPad ()

@end

@implementation QSProjectViewController_IPad
@synthesize projectCellIPad = _projectCellIPad;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QSProjectModel *model = [self.items objectAtIndex:indexPath.row];
    QSProjectCell_IPad * cell = (QSProjectCell_IPad *)self.projectCellIPad;
    [cell setModel:model];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height = 2.0f;
    
   // return height;
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QSProjectModel *model = [self.items objectAtIndex:indexPath.row];
    
    QSProjectCell_IPad *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSProjectCell_IPad class])];
    if (!cell) {
        return nil;
    }
    [cell setModel:model];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QSProjectCell_IPad class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QSProjectCell_IPad class])];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 8;
//}

- (QSProjectCell_IPad *) projectCellIPad {
    if (!_projectCellIPad) {
        _projectCellIPad = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([QSProjectCell_IPad class]) owner:self options:nil] firstObject];
    }
    return _projectCellIPad;
}
@end
