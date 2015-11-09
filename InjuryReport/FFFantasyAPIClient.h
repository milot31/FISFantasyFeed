//
//  FFFantasyAPIClient.h
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFFantasyAPIClient : NSObject

+(void)getActiveQBPlayersWithCompletion:(void (^)(NSDictionary *quarterBacks))completion;

+(void)getActiveRBPlayersWithCompletion:(void (^)(NSDictionary *runningBacks))completion;

+(void)getActiveWRPlayersWithCompletion:(void (^)(NSDictionary *wideReceivers))completion;

+(void)getActiveTEPlayersWithCompletion:(void (^)(NSDictionary *tightEnds))completion;

+(void)getActiveKPlayersWithCompletion:(void (^)(NSDictionary *kickers))completion;

+(void)getActiveDEFPlayersWithCompletion:(void (^)(NSDictionary *defenses))completion;

@end
