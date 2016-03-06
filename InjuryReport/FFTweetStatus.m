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
    
    if (dictionary[@"retweeted_status"] != nil) {
        someStatus.isRetweet = YES;
        someStatus.retweetHandle = dictionary[@"retweeted_status"][@"user"][@"name"];
        someStatus.tweetText = dictionary[@"retweeted_status"][@"text"];
    } else {
        someStatus.isRetweet = NO;
        someStatus.retweetHandle = nil;
        someStatus.tweetText = dictionary[@"text"];
    }

 
    someStatus.realName = [dictionary valueForKeyPath:@"user.name"];
    someStatus.twitterHandle = [NSString stringWithFormat:@"@%@", [dictionary valueForKeyPath:@"user.screen_name"]];
    someStatus.imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[dictionary valueForKeyPath:@"user.profile_image_url_https"]]];
    
//    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss ZZZ yyyy"];
//    NSDate* createdDate = [dateFormatter dateFromString:dictionary[@"created_at"]];
//    NSDateFormatter *visibleDate = [[NSDateFormatter alloc]init];
//    [visibleDate setDateFormat:@"MMM dd ''yy',' h:mm a"];
//    someStatus.createdDate = [visibleDate stringFromDate:createdDate];
    
    NSString *date = dictionary[@"created_at"];
    someStatus.createdDate = [self getTimeSincePost:date];
    
    return someStatus;
}

+(NSString *)getTimeSincePost:(NSString *)dateString {
    
    //date from twitter JSON
    NSDateFormatter *twitterFormatter = [[NSDateFormatter alloc]init];
    [twitterFormatter setDateFormat:@"EEE MMM dd HH:mm:ss ZZZ yyyy"];
    NSDate *createdDate = [twitterFormatter dateFromString:dateString];
    
    NSDateFormatter *properFormat = [[NSDateFormatter alloc]init];
    [properFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *stringFromDate = [properFormat stringFromDate:createdDate];

    //current date
    NSDateFormatter *currentFormat = [[NSDateFormatter alloc]init];
    [currentFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDate = [currentFormat stringFromDate:[NSDate date]];
    
    
    NSDateFormatter *labelFormat = [[NSDateFormatter alloc]init];
    [labelFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *start = [labelFormat dateFromString:stringFromDate];
    NSDate *end = [labelFormat dateFromString:currentDate];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dayComps = [calendar components:NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:start toDate:end options:NSCalendarWrapComponents];
    
    NSInteger daysSince = [dayComps day];
    NSInteger hoursSince = [dayComps hour];
    NSInteger minutesSince = [dayComps minute];
    NSInteger secondsSince = [dayComps second];
    
    NSString *timeSince = @"";
    
    if (daysSince >= 1) {
        timeSince = [NSString stringWithFormat:@"%lid ago", daysSince];
    } else if (daysSince < 1 && hoursSince >= 1) {
        timeSince = [NSString stringWithFormat:@"%lih ago", hoursSince];
    } else if (hoursSince < 1 && minutesSince >= 1) {
        timeSince = [NSString stringWithFormat:@"%lim ago", minutesSince];
    } else if (minutesSince < 1) {
        timeSince = [NSString stringWithFormat:@"%lis ago", secondsSince];
    }
    
    return timeSince;
    
}

@end
