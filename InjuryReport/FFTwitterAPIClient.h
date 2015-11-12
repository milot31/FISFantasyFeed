//
//  FFTwitterAPIClient.h
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <STTwitter.h>
#import "Constants.h"
#import "FISPlayerFeedTableViewController.h"

@interface FFTwitterAPIClient : NSObject


+(void)getTwitterStatuses: (NSString *)playerName withCompletion: (void (^) (NSArray* statuses))completionBlock;
@end
