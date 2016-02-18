//
//  FFNewsArticle.m
//  InjuryReport
//
//  Created by Phil Milot on 2/1/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import "FFNewsArticle.h"

@implementation FFNewsArticle

+(FFNewsArticle *)newsFromDictionary:(NSDictionary *)dict {
    
    FFNewsArticle *new = [[FFNewsArticle alloc]init];
    
    new.site = dict[@"Source"];
    new.team = dict[@"Team"];
    new.title = dict[@"Title"];
    
    NSMutableString *date = dict[@"Updated"];
    [date substringToIndex:11];
    NSDateFormatter *format = [[NSDateFormatter alloc ]init];
    [format setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSDate *updated = [format dateFromString:date];
    NSDateFormatter *format2 = [[NSDateFormatter alloc]init];
    [format2 setDateFormat:@"MMM dd yy"];
    NSString *newDate = [format2 stringFromDate:updated];
    new.date = newDate;
    
    NSURL *url = [NSURL URLWithString:dict[@"Url"]];
    new.url = url;
    return new;
}

@end
