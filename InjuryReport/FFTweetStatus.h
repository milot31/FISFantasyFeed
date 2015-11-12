//
//  FFTweetStatus.h
//  InjuryReport
//
//  Created by Linda NG on 11/12/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFTweetStatus : NSObject

@property (nonatomic, strong) NSString* tweetText;
@property (nonatomic, strong) NSString* createdDate;
@property (nonatomic, strong) NSString* twitterHandle;
@property (nonatomic, strong) NSString* realName;
@property (nonatomic, strong) NSData* imageData;


+(instancetype)statusesFromDictionary:(NSDictionary *)dictionary;

@end
