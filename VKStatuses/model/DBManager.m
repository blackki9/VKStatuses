//
//  DBManager.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "DBManager.h"
#define MR_SHORTHAND
#import <CoreData+MagicalRecord.h>

@implementation DBManager

+ (instancetype)sharedManager
{
    static dispatch_once_t once;
    static DBManager* sharedInstance = nil;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)setupDB
{
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"VKStatuses"];
}

- (void)save
{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        if(!error) {
            NSLog(@"saved success");
        }
        else {
            NSLog(@"save completed with error %@",[error localizedDescription]);
        }
    }];
}

@end
