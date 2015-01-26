//
//  ParseCommand.h
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCommand.h"
#import "CommonBlocks.h"


@interface ParseCommand : NSObject<BaseCommand>

@property (nonatomic,copy) NSString* filePath;
@property (nonatomic,strong) CompletitionParseBlock finishBlock;

@end
