//
//  QSProjectViewController_IPad.m
//  Project Managerment
//
//  Created by MinhTien on 6/5/14.
//  Copyright (c) 2014 Cừu Lười. All rights reserved.
//

#import "QSProjectViewController_IPad.h"
<<<<<<< HEAD
#import "QSProjectModel.h"
#import "QSProjectCell_IPad.h"
=======
>>>>>>> c60851267268b4cad40f4ca598120ca374f76efe

@interface QSProjectViewController_IPad ()

@end

@implementation QSProjectViewController_IPad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
<<<<<<< HEAD
=======
        // Custom initialization
>>>>>>> c60851267268b4cad40f4ca598120ca374f76efe
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
<<<<<<< HEAD
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QSProjectCell_IPad class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QSProjectCell_IPad class])];
=======
    // Do any additional setup after loading the view from its nib.
>>>>>>> c60851267268b4cad40f4ca598120ca374f76efe
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
<<<<<<< HEAD
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
=======
    // Dispose of any resources that can be recreated.
}

>>>>>>> c60851267268b4cad40f4ca598120ca374f76efe
@end
