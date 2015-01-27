//
//  StatusGroupsTableDataSource.m
//  VKStatuses
//
//  Created by black9 on 27/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "StatusGroupsTableDataSource.h"

@implementation StatusGroupsTableDataSource

- (void)initializeData
{
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}



@end
