//
//  DownloadManager.m
//  VKStatuses
//
//  Created by black9 on 26/01/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "DownloadManager.h"
@import UIKit;

@interface DownloadManager()

@property (nonatomic, strong) NSMutableData* receivedData;
@property (nonatomic, assign) NSInteger expectedBytes;
@property (nonatomic, strong) NSString* currentURL;
@property (nonatomic, strong) UIProgressView* progress;
@property (nonatomic, strong) CompletitionDownloadBlock finishBlock;
@end


@implementation DownloadManager

+ (instancetype)sharedManager
{
    static dispatch_once_t once;
    static DownloadManager* sharedInstance = nil;
    dispatch_once(&once,^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

-(void)downloadFile:(NSString*)fileURL completition:(CompletitionDownloadBlock)complete
{
    self.currentURL = fileURL;
    self.finishBlock = complete;
    NSURL *url = [NSURL URLWithString:self.currentURL];
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:url         cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60];
    self.receivedData = [[NSMutableData alloc] initWithLength:0];
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self     startImmediately:YES];
    
    [connection start];
}


- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.progress.hidden = NO;
    [self.receivedData setLength:0];
    self.expectedBytes = [response expectedContentLength];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.receivedData appendData:data];
    float progressive = (float)[self.receivedData length] / (float)self.expectedBytes;
    [self.progress setProgress:progressive];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (NSCachedURLResponse *) connection:(NSURLConnection *)connection willCacheResponse:    (NSCachedURLResponse *)cachedResponse {
    return nil;
}


- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[self.currentURL stringByAppendingString:@".plist"]];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.receivedData writeToFile:filePath atomically:YES];
    self.progress.hidden = YES;
    
    if(self.finishBlock) {
        self.finishBlock(filePath);
    }
    
}


@end
