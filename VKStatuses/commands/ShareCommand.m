//
//  ShareCommand.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "ShareCommand.h"
#import "ShareManager.h"

@implementation ShareCommand

- (void)execute
{
    [self shareText:self.statusForShare completition:self.finishBlock];
}

- (void)shareText:(Status*)status completition:(CompletitionShareBlock)completition
{
    [[ShareManager sharedManager] shareStatus:status controller:self.baseViewControllerForShare completition:self.finishBlock];
}

@end
