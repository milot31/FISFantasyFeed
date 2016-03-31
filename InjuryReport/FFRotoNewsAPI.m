//
//  FFRotoNewsAPI.m
//  InjuryReport
//
//  Created by Phil Milot on 2/1/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import "FFRotoNewsAPI.h"

@implementation FFRotoNewsAPI

+(void)getNewsWithCompletion:(void (^)(NSArray *rotoNewsArray, NSError *newsError))completion {
    NSURL *rssSearch = [NSURL URLWithString:@"http://fantasydata.com/rss/rotoworld/?format=json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:rssSearch];
    NSURLSession *session =[NSURLSession sharedSession];
    NSURLSessionDataTask *rssData = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSArray *rssArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            completion(rssArray, nil);
        } else {
            completion(nil, error);
        }
    }];
    [rssData resume];
}

@end
