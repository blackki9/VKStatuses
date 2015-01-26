//
//  DownloadCommand.h
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CommonBlocks.h"

#import "BaseCommand.h"

@interface DownloadCommand : NSObject <BaseCommand>

@property (nonatomic, strong) NSString* url;
@property (nonatomic, strong) CompletitionDownloadBlock complete;

@end
