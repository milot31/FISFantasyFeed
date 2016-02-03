//
//  FFNewsArticle.h
//  InjuryReport
//
//  Created by Phil Milot on 2/1/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFNewsArticle : NSObject

@property (nonatomic, strong) NSString *site;
@property (nonatomic, strong) NSString *team;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;

+(FFNewsArticle *)newsFromDictionary:(NSDictionary *)dict;

@end
