//
//  StatusGroupViewController.m
//  VKStatuses
//
//  Created by black9 on 27/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "StatusGroupViewController.h"
#import "StatusListDataSource.h"

@interface StatusGroupViewController()


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) StatusListDataSource* dataSource;
@end

@implementation StatusGroupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = [[StatusListDataSource alloc] init];
    
    self.tableView.dataSource = self.dataSource;
}

@end
