//
//  MainViewController.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "MainViewController.h"
#import "StatusGroupsTableDataSource.h"

@interface MainViewController()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) StatusGroupsTableDataSource* dataSource;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = [[StatusGroupsTableDataSource alloc] init];
    [self.dataSource initializeData];
    
    self.tableView.dataSource = self.dataSource;
}



@end
