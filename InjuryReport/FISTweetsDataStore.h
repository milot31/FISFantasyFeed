//
//  FISTweetsDataStore.h
//  InjuryReport
//
//  Created by Linda NG on 11/12/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFTwitterAPIClient.h"

@interface FISTweetsDataStore : NSObject

@property (strong, nonatomic) NSMutableArray *tweets;

-(void)loadPlayerFeedForPlayer:(NSString *)player withCompletion:(void (^)(BOOL success))completionBlock;

+ (instancetype)tweetsDataStore;


@end
