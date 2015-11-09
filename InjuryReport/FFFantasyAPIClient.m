//
//  FFFantasyAPIClient.m
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FFFantasyAPIClient.h"

@implementation FFFantasyAPIClient

+(void)getActiveQBPlayersWithCompletion:(void (^)(NSDictionary *quarterBacks))completion {
    
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

+(void)getActiveRBPlayersWithCompletion:(void (^)(NSDictionary *runningBacks))completion {
    
    NSString *rbURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/RB"];
    NSURL *rbSearch = [NSURL URLWithString:rbURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:rbSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *rbData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        completion(playerDict);
    }];
    [rbData resume];
}

+(void)getActiveWRPlayersWithCompletion:(void (^)(NSDictionary *wideReceivers))completion {
    
    NSString *wrURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/WR"];
    NSURL *wrSearch = [NSURL URLWithString:wrURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:wrSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *wrData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        completion(playerDict);
    }];
    [wrData resume];
}

+(void)getActiveTEPlayersWithCompletion:(void (^)(NSDictionary *tightEnds))completion {
    
    NSString *teURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/TE"];
    NSURL *teSearch = [NSURL URLWithString:teURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:teSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *teData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        completion(playerDict);
    }];
    [teData resume];
}

+(void)getActiveKPlayersWithCompletion:(void (^)(NSDictionary *kickers))completion {
    
    NSString *kURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/K"];
    NSURL *kSearch = [NSURL URLWithString:kURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:kSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *kData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        completion(playerDict);
    }];
    [kData resume];
}

+(void)getActiveDEFPlayersWithCompletion:(void (^)(NSDictionary *defenses))completion {
    
    NSString *defURL = [NSString stringWithFormat:@"http://www.fantasyfootballnerd.com/service/players/json/bgpatwpqvuge/DEF"];
    NSURL *defSearch = [NSURL URLWithString:defURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:defSearch];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *defData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *playerDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        completion(playerDict);
    }];
    [defData resume];
}

@end
