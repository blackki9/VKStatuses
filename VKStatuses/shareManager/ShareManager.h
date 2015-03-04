//
//  ShareManager.h
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonBlocks.h"

@class Status;
@class UIViewController;
@protocol VKSdkDelegate;

@interface ShareManager : NSObject <VKSdkDelegate>

+ (instancetype)sharedManager;

- (void)shareStatus:(Status*)status controller:(UIViewController*) controller completition:(CompletitionShareBlock)finishBlock;

@end
