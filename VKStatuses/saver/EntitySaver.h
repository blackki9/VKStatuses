//
//  EntitySaver.h
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonBlocks.h"

@interface EntitySaver : NSObject

+ (instancetype)sharedSaver;

- (void)saveEntities:(NSArray*)entityDescriptions completition:(CompletitionSaveBlock)completition;

@end
