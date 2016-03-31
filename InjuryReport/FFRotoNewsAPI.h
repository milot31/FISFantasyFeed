//
//  FFRotoNewsAPI.h
//  InjuryReport
//
//  Created by Phil Milot on 2/1/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFRotoNewsAPI : NSObject

+(void)getNewsWithCompletion:(void (^)(NSArray *rotoNewsArray, NSError *newsError))completion;

@end
