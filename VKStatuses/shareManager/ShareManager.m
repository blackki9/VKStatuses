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

static NSString* const vkAppId = @"4749882 ";

@interface ShareManager()

@property (nonatomic, strong) Status* currentShareStatus;
@property (nonatomic, strong) UIViewController * parentController;
@property (nonatomic, strong) CompletitionShareBlock finishBlock;
@end

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

- (void)authorizeUser
{
    [VKSdk authorize:nil];
}

#pragma mark - share

- (void)shareStatus:(Status*)status controller:(UIViewController*) controller completition:(CompletitionShareBlock)finishBlock
{
    self.currentShareStatus = status;
    self.parentController = controller;
    self.finishBlock = finishBlock;
    
    [self authorizeUser];
}

- (void)shareStatusText:(NSString*)text
{
    VKShareDialogController* shareDialog = [VKShareDialogController new];
    shareDialog.text = text;
    // use uploadImages to upload internal images
    
    [shareDialog setCompletionHandler:^(VKShareDialogControllerResult result) {
        [self.parentController dismissViewControllerAnimated:YES completion:nil];
        if(self.finishBlock) {//do we need this check?
            self.finishBlock(result == VKShareDialogControllerResultDone);
        }
    }];
    
    [self.parentController presentViewController:shareDialog animated:YES completion:nil];
}

#pragma mark - VKSdkDelegate

-(void) vkSdkReceivedNewToken:(VKAccessToken*) newToken
{
    [self shareStatusText:self.currentShareStatus.text];
}

-(void) vkSdkUserDeniedAccess:(VKError*) authorizationError
{
    self.currentShareStatus = nil;
}

- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken
{
    self.currentShareStatus = nil;
}

@end
