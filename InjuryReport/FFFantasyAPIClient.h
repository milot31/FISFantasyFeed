//
//  FFFantasyAPIClient.h
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFFantasyAPIClient : NSObject

+(void)getActiveQBPlayersWithCompletion:(void (^)(NSDictionary *quarterBacks, NSError *qbError))completion;

+(void)getActiveRBPlayersWithCompletion:(void (^)(NSDictionary *runningBacks, NSError *rbError))completion;

+(void)getActiveWRPlayersWithCompletion:(void (^)(NSDictionary *wideReceivers, NSError *wrError))completion;

+(void)getActiveTEPlayersWithCompletion:(void (^)(NSDictionary *tightEnds, NSError *teError))completion;

+(void)getActiveKPlayersWithCompletion:(void (^)(NSDictionary *kickers, NSError *kError))completion;

+(void)getActiveDEFPlayersWithCompletion:(void (^)(NSDictionary *defenses, NSError *defError))completion;

@end
