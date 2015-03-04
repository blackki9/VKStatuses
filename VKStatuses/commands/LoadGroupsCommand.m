//
//  LoadGroupsCommand.m
//  VKStatuses
//
//  Created by black9 on 21/02/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "LoadGroupsCommand.h"
#import "StatusGroup.h"
#import <CoreData+MagicalRecord.h>

@implementation LoadGroupsCommand

- (void)execute
{
   self.finishBlock([StatusGroup MR_findAll]);
}



@end
