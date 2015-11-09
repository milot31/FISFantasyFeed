//
//  FFFantasyAPIClient.h
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFFantasyAPIClient : NSObject

+(void)getActiveQBPlayersWithCompletion:(void (^)(NSDictionary *quarterbacks))completion;

+(void)getActiveRBPlayersWithCompletion:(void (^)(BOOL success))completion;

+(void)getActiveWRPlayersWithCompletion:(void (^)(BOOL success))completion;

+(void)getActiveTEPlayersWithCompletion:(void (^)(BOOL success))completion;

+(void)getActiveKPlayersWithCompletion:(void (^)(BOOL success))completion;

+(void)getActiveDEFPlayersWithCompletion:(void (^)(BOOL success))completion;

@end
