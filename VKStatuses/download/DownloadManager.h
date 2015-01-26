//
//  DownloadManager.h
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonBlocks.h"

@interface DownloadManager : NSObject

+ (instancetype)sharedManager;

-(void)downloadFile:(NSString*)fileURL completition:(CompletitionDownloadBlock)complete;

@end
