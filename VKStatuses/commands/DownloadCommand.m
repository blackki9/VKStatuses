//
//  DownloadCommand.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "DownloadCommand.h"
#import "DownloadManager.h"

@implementation DownloadCommand

- (void)execute
{
    [self downloadFileWithURL:self.url completition:self.complete];
}

- (void)downloadFileWithURL:(NSString*)url completition:(CompletitionDownloadBlock)complete;
{
    [[DownloadManager sharedManager] downloadFile:url completition:complete];
}


@end
