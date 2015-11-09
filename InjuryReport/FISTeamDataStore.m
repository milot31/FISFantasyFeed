//
//  FISTeamDataStore.m
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FISTeamDataStore.h"

@implementation FISTeamDataStore

+ (instancetype)sharedDataStore {
    static FISTeamDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[FISTeamDataStore alloc] init];
    });
    
    return _sharedDataStore;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _team=[NSMutableArray new];
    }
    return self;
}

@end
