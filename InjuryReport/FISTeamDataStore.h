//
//  FISTeamDataStore.h
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@interface FISTeamDataStore : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray *team;

+ (instancetype)sharedDataStore;
- (void) saveContext;
- (void) fetchData;



@end
