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
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QSProjectCell_IPad class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QSProjectCell_IPad class])];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QSProjectCell_IPad *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QSProjectCell_IPad class])];
    QSProjectModel *model = [self.items objectAtIndex:indexPath.row];
    [cell setModel:model];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}
@end
