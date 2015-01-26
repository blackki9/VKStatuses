//
//  ParseCommand.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "ParseCommand.h"
#import "Parser.h"

@implementation ParseCommand

- (void)execute
{
    [self parseFileWithPath:self.filePath completition:self.finishBlock];
}

- (void)parseFileWithPath:(NSString*)filePath completition:(CompletitionParseBlock)complete
{
    [[Parser sharedParser] parseFileWithName:filePath completition:complete];
}

@end
