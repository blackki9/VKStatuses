//
//  CommonBlocks.h
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#ifndef VKStatuses_CommonBlocks_h
#define VKStatuses_CommonBlocks_h

typedef void (^CompletitionDownloadBlock)(NSString* filePath); //return path where downloaded file was saved
typedef void (^CompletitionParseBlock)(NSArray* groups);//return parsed groups of statuses

typedef void (^CompletitionSaveBlock)();

typedef void (^CompletitionShareBlock)(BOOL success);

#endif
