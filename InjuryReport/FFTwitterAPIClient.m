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
    
STTwitterAPI *twitter = [STTwitterAPI twitterAPIAppOnlyWithConsumerKey:consumerKey
                                                        consumerSecret:consumerSecret];

[twitter verifyCredentialsWithUserSuccessBlock:^(NSString *username, NSString *userID) {
    NSLog(@"-- Account: %@", username);
    
    [twitter getSearchTweetsWithQuery:playerName successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
        
        NSLog(@"%@", statuses);
        completionBlock(statuses);
        
    } errorBlock:^(NSError *error) {
        
    }];
    
} errorBlock:^(NSError *error) {
    NSLog(@"-- %@", [error localizedDescription]);
    exit(1);
    
}];}


@end
