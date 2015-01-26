//
//  ShareManager.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "ShareManager.h"
#import "Status.h"
#import <VKSdk.h>

static NSString* const vkAppId = @"";

@implementation ShareManager
#pragma mark - init
+ (instancetype)sharedManager
{
    static dispatch_once_t once;
    static ShareManager* shared = nil;
    dispatch_once(&once, ^{
        shared = [[self alloc] init];
    });
    
    return shared;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSdk];
    }
    return self;
}

- (void)initSdk
{
    [VKSdk initializeWithDelegate:self andAppId:vkAppId];
    if([VKSdk wakeUpSession]) {
        
    }
}

#pragma mark - authorize

- (void)authrizeUser
{
    [VKSdk authorize:<#(NSArray *)#>];
}

#pragma mark - share

#warning TODO share status
- (void)shareStatus:(Status*)status
{

}

#pragma mark - VKSdkDelegate

-(void) vkSdkReceivedNewToken:(VKAccessToken*) newToken
{
    
}

-(void) vkSdkUserDeniedAccess:(VKError*) authorizationError
{
    
}

@end
