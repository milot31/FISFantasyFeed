//
//  FFTwitterAPIClient.m
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FFTwitterAPIClient.h"

@implementation FFTwitterAPIClient

+(void)getTwitterStatuses: (NSString *)playerName withCompletion: (void (^) (NSArray* statuses))completionBlock{
    
    STTwitterAPI *twitter = [STTwitterAPI twitterAPIAppOnlyWithConsumerKey:consumerKey
                                                            consumerSecret:consumerSecret];

    [twitter verifyCredentialsWithUserSuccessBlock:^(NSString *username, NSString *userID) {

        NSString *searchQuery = [NSString stringWithFormat:@"(from:Stephania_ESPN OR from:MatthewBerryTMR OR from:thepme OR from:Michael_Fabiano OR from:YahooFootball OR from:evansilva OR from:scotteRotoEx OR from:josinaanderson OR from:allinkid OR from:EricMackFantasy OR from:nfl OR from:espn OR from:sportscenter) AND %@ since:2015-09-01", playerName];
        
        [twitter getSearchTweetsWithQuery:searchQuery successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
            completionBlock(statuses);
        } errorBlock:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
    } errorBlock:^(NSError *error) {
        NSLog(@"-- %@", [error localizedDescription]);
        
    }];
}



@end
