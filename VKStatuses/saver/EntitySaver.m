//
//  EntitySaver.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "EntitySaver.h"

@implementation EntitySaver

+ (instancetype)sharedSaver
{
    static dispatch_once_t once;
    static EntitySaver* sharedInstance = nil;
    dispatch_once(&once,^ {
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)saveEntities:(NSArray*)entityDescriptions completition:(CompletitionSaveBlock)completition
{
    
}

@end
