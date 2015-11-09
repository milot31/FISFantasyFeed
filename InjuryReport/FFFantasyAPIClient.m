//
//  FFFantasyAPIClient.m
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FFFantasyAPIClient.h"

@implementation FFFantasyAPIClient

+(void)getActiveQBPlayersWithCompletion:(void (^)(NSDictionary *quarterbacks))completion {
    
    NSString *qbURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/QB"];
    NSURL *qbSearch = [NSURL URLWithString:qbURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:qbSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *qbData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        completion(playerDict);
    }];
    [qbData resume];
}

+(void)getActiveRBPlayersWithCompletion:(void (^)(BOOL success))completion {
    
}

+(void)getActiveWRPlayersWithCompletion:(void (^)(BOOL success))completion {
    
}

+(void)getActiveTEPlayersWithCompletion:(void (^)(BOOL success))completion {
    
}

+(void)getActiveKPlayersWithCompletion:(void (^)(BOOL success))completion {
    
}

+(void)getActiveDEFPlayersWithCompletion:(void (^)(BOOL success))completion {
    
}

@end
