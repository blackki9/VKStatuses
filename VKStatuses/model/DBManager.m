//
//  DBManager.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager

+ (instancetype)sharedManager
{
    static dispatch_once_t once;
    static DBManager* sharedInstance = nil;
    dispatch_once(^once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

@end
