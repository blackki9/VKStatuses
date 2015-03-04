//
//  LoadGroupsCommand.h
//  VKStatuses
//
//  Created by black9 on 21/02/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCommand.h"
#import "CommonBlocks.h"

@interface LoadGroupsCommand : NSObject<BaseCommand>


@property (nonatomic, strong) CompletitionLoadGroupsBlock finishBlock;

@end
