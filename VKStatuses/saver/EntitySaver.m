//
//  EntitySaver.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "EntitySaver.h"
#import "Status.h"
#import "StatusGroup.h"
#import "DBManager.h"

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
    for(NSDictionary* groupInfo in entityDescriptions) {
        [self createStatusGroupWithDescription:groupInfo];
    }
}

- (void)createStatusGroupWithDescription:(NSDictionary*)groupDescription
{
    NSString* groupName = groupDescription[@"groupName"];
    NSArray* statuses = groupDescription[@"statuses"];
    
    StatusGroup* newGroup = [StatusGroup MR_createEntity];
    newGroup.title = groupName;
    
    for(NSDictionary* statusDescription in statuses) {
        [newGroup addStatusesObject:[self createStatusWithDescription:statusDescription group:newGroup]];
    }
    
    [[DBManager sharedManager] save];
}

- (Status*)createStatusWithDescription:(NSDictionary*)statusDescription group:(StatusGroup*)group
{
    Status* result = [Status MR_createEntity];
    
    [result addGroupsObject:group];
    
    result.text = statusDescription[@"statusText"];
    
    return result;
}



@end
