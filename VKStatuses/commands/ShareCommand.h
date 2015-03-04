//
//  ShareCommand.h
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCommand.h"
#import "CommonBlocks.h"
#import <UIKit/UIKit.h>

@class Status;

@interface ShareCommand : NSObject <BaseCommand>

@property (nonatomic, strong) Status* statusForShare;
@property (nonatomic, strong) CompletitionShareBlock finishBlock;
@property (nonatomic, strong) UIViewController* baseViewControllerForShare;
@end
