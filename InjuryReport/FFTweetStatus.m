//
//  FFTweetStatus.m
//  InjuryReport
//
//  Created by Linda NG on 11/12/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FFTweetStatus.h"

@implementation FFTweetStatus

+(instancetype)statusesFromDictionary:(NSDictionary *)dictionary{
    FFTweetStatus *someStatus = [[FFTweetStatus alloc]init];

 
    someStatus.tweetText = dictionary[@"text"];
    someStatus.realName = [dictionary valueForKeyPath:@"user.name"];
    someStatus.twitterHandle = [NSString stringWithFormat:@"@%@", [dictionary valueForKeyPath:@"user.screen_name"]];
    someStatus.imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[dictionary valueForKeyPath:@"user.profile_image_url_https"]]];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss ZZZ yyyy"];
    NSDate* createdDate = [dateFormatter dateFromString:dictionary[@"created_at"]];
    NSDateFormatter *visibleDate = [[NSDateFormatter alloc]init];
    [visibleDate setDateFormat:@"MMM dd yy hh:mm"];
    someStatus.createdDate = [visibleDate stringFromDate:createdDate];
    return someStatus;
}

@end
