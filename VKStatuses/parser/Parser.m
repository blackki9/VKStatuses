//
//  Parser.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "Parser.h"

@implementation Parser

+ (instancetype)sharedParser
{
    static dispatch_once_t once;
    static Parser* sharedInstance = nil;
    dispatch_once(&once, ^ {
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)parseFileWithName:(NSString*)fileName completition:(CompletitionParseBlock)completition
{
    NSArray* descriptions = [NSArray arrayWithContentsOfFile:fileName];
    if(descriptions) {
        completition(descriptions);
    }
    else {
        completition(nil);
    }
}

@end
