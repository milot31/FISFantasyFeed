//
//  TwitterTableViewCell.h
//  InjuryReport
//
//  Created by Phil Milot on 2/5/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *twitterHandle;
@property (strong, nonatomic) IBOutlet UILabel *displayName;
@property (strong, nonatomic) IBOutlet UILabel *timePosted;
@property (strong, nonatomic) IBOutlet UITextView *tweetBody;
@property (strong, nonatomic) IBOutlet UIImageView *twitterAvi;

@end
