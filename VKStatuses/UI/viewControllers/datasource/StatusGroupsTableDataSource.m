//
//  StatusGroupsTableDataSource.m
//  VKStatuses
//
//  Created by black9 on 27/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "StatusGroupsTableDataSource.h"
#import "LoadGroupsCommand.h"

#import "LoadGroupsCommand.h"

@interface StatusGroupsTableDataSource()

@property (nonatomic, strong) LoadGroupsCommand* loadCommand;
@property (nonatomic, strong) NSArray* allGroups;
@end

@implementation StatusGroupsTableDataSource

- (void)initializeData
{
    self.loadCommand = [[LoadGroupsCommand alloc] init];
    
    self.allGroups = [NSArray array];
    
    __weak StatusGroupsTableDataSource* weakSelf = self;
    
    self.loadCommand.finishBlock = ^(NSArray* groups) {
        weakSelf.allGroups = groups;
    };
    
    [self.loadCommand execute];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allGroups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return nil;
}



@end
