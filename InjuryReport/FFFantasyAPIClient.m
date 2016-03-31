//
//  FFFantasyAPIClient.m
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FFFantasyAPIClient.h"

@implementation FFFantasyAPIClient

+(void)getActiveQBPlayersWithCompletion:(void (^)(NSDictionary *quarterBacks, NSError *qbError))completion {
    
    NSString *qbURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/QB"];
    NSURL *qbSearch = [NSURL URLWithString:qbURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:qbSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *qbData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //if data is not nil, then do the below
        if (data != nil) {
            NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            completion(playerDict, nil);
        } else {
            completion(nil, error);
        }
        //else, handle the error
    }];
    [qbData resume];
}

+(void)getActiveRBPlayersWithCompletion:(void (^)(NSDictionary *runningBacks, NSError *rbError))completion {
    
    NSString *rbURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/RB"];
    NSURL *rbSearch = [NSURL URLWithString:rbURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:rbSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *rbData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            completion(playerDict, nil);
        } else {
            completion(nil, error);
        }
    }];
    [rbData resume];
}

+(void)getActiveWRPlayersWithCompletion:(void (^)(NSDictionary *wideReceivers, NSError *wrError))completion {
    
    NSString *wrURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/WR"];
    NSURL *wrSearch = [NSURL URLWithString:wrURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:wrSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *wrData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            completion(playerDict, nil);
        } else {
            completion(nil, error);
        }
    }];
    [wrData resume];
}

+(void)getActiveTEPlayersWithCompletion:(void (^)(NSDictionary *tightEnds, NSError *teError))completion {
    
    NSString *teURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/TE"];
    NSURL *teSearch = [NSURL URLWithString:teURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:teSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *teData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            completion(playerDict, nil);
        } else {
            completion(nil, error);
        }
    }];
    [teData resume];
}

+(void)getActiveKPlayersWithCompletion:(void (^)(NSDictionary *kickers, NSError *kError))completion {
    
    NSString *kURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/K"];
    NSURL *kSearch = [NSURL URLWithString:kURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:kSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *kData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            completion(playerDict, nil);
        } else {
            completion(nil, error);
        }
    }];
    [kData resume];
}

+(void)getActiveDEFPlayersWithCompletion:(void (^)(NSDictionary *defenses, NSError *defError))completion {
    
    NSString *defURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/DEF"];
    NSURL *defSearch = [NSURL URLWithString:defURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:defSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *defData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            completion(playerDict, nil);
        } else {
            completion(nil, error);
        }
    }];
    [defData resume];
}

@end
