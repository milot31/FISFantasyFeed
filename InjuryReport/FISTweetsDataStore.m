//
//  FISTweetsDataStore.m
//  InjuryReport
//
//  Created by Linda NG on 11/12/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FISTweetsDataStore.h"
#import "FFTwitterAPIClient.h"
#import "FFTweetStatus.h"

@implementation FISTweetsDataStore


+ (instancetype)tweetsDataStore {
    static FISTweetsDataStore *_tweetsDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tweetsDataStore = [[FISTweetsDataStore alloc] init];
    });
    
    return _tweetsDataStore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tweets=[NSMutableArray new];
    }
    return self;
}

-(void)loadPlayerFeedForPlayer:(NSString *)player withCompletion:(void (^)(BOOL success))completionBlock{
    [FFTwitterAPIClient getTwitterStatuses:player withCompletion:^(NSArray *statuses) {
        for (NSDictionary *dictionary in statuses) {
            FFTweetStatus *newStatus = [FFTweetStatus statusesFromDictionary:dictionary];
            if (![self.tweets containsObject:newStatus]) {
                [self.tweets addObject:newStatus];
            }
        }
        completionBlock(YES);
    }];
    
}


@end
