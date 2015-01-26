//
//  SaveEntitiesCommand.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "SaveEntitiesCommand.h"
#import "EntitySaver.h"

@implementation SaveEntitiesCommand

- (void)execute
{
    [self saveEntities:self.entityDescriptions completition:self.finishBlock];
}

- (void)saveEntities:(NSArray*)entityDescriptions completition:(CompletitionSaveBlock)completition
{
    [[EntitySaver sharedSaver] saveEntities:entityDescriptions completition:completition];
}

@end
