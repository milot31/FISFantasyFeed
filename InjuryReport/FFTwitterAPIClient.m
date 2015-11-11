//
//  FFTwitterAPIClient.m
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FFTwitterAPIClient.h"

@implementation FFTwitterAPIClient

+(void)getTwitterStatuses: (NSString *)playerName withCompletion: (void (^) (NSArray* playerFeed))completionBlock{
    
STTwitterAPI *twitter = [STTwitterAPI twitterAPIAppOnlyWithConsumerKey:@"R5G74WainMpMxCUDDbwystU95"
                                                        consumerSecret:@"waWp8K8JhHpJWp5eKcAMS65oTkL1RhjCKomScHma6nvV4ansTG"];

[twitter verifyCredentialsWithUserSuccessBlock:^(NSString *username, NSString *userID) {
    //NSLog(@"-- Account: %@", username);
    
//    [twitter getSearchTweetsWithQuery:playerName successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
//        
//        NSLog(@"%@", statuses);
//        completionBlock(statuses);
//        
//    } errorBlock:^(NSError *error) {
//        
//    }];
//    
//    [twitter postStatusesFilterUserIDs:twitterHandles keywordsToTrack:keyword locationBoundingBoxes:nil stallWarnings:nil progressBlock:^(NSDictionary *json, STTwitterStreamJSONType type) {
//        NSLog(@"%@", json);
//    } errorBlock:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];
    
    NSString *searchQuery = [NSString stringWithFormat:@"(from:Stephania_ESPN OR from:MatthewBerryTMR OR from:thepme OR from:Michael_Fabiano OR from:YahooFootball OR from:evansilva OR from:scotteRotoEx OR from:josinaanderson OR from:allinkid OR from:EricMackFantasy) AND %@ since:2015-09-01", playerName];
    
    [twitter getSearchTweetsWithQuery:searchQuery successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
        NSLog(@"%@", statuses);
        completionBlock(statuses);
    } errorBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
} errorBlock:^(NSError *error) {
    NSLog(@"-- %@", [error localizedDescription]);
    //exit(1);
    
}];
}


@end
