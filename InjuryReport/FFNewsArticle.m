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
    [format setDateFormat:@"MM dd yy"];
    NSDate *updated = [format dateFromString:date];
    NSString *newDate = [format stringFromDate:updated];
    new.date = newDate;
    
    new.url = dict[@"Url"];
    return new;
}

@end
