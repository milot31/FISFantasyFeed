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
    
    NSArray *twitterHandles = @[ @"@Stephania_ESPN", @"@MatthewBerryTMR", @"@thepme", @"@Michael_Fabiano", @"@YahooFootball", @"@evansilva", @"@scotteRotoEx", @"@josinaanderson", @"@allinkid", @"@EricMackFantasy"];
    
    NSArray *keyword = @[ playerName ];
    
STTwitterAPI *twitter = [STTwitterAPI twitterAPIAppOnlyWithConsumerKey:@"R5G74WainMpMxCUDDbwystU95"
                                                        consumerSecret:@"waWp8K8JhHpJWp5eKcAMS65oTkL1RhjCKomScHma6nvV4ansTG"];

[twitter verifyCredentialsWithUserSuccessBlock:^(NSString *username, NSString *userID) {
    NSLog(@"-- Account: %@", username);
    
//    [twitter getSearchTweetsWithQuery:playerName successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
//        
//        NSLog(@"%@", statuses);
//        completionBlock(statuses);
//        
//    } errorBlock:^(NSError *error) {
//        
//    }];
    
    [twitter postStatusesFilterUserIDs:twitterHandles keywordsToTrack:keyword locationBoundingBoxes:nil stallWarnings:nil progressBlock:^(NSDictionary *json, STTwitterStreamJSONType type) {
        NSLog(@"%@", json);
    } errorBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
} errorBlock:^(NSError *error) {
    NSLog(@"-- %@", [error localizedDescription]);
    //exit(1);
    
}];
}


@end
