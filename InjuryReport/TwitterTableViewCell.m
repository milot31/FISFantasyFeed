//
//  TwitterTableViewCell.m
//  InjuryReport
//
//  Created by Phil Milot on 2/5/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import "TwitterTableViewCell.h"

@implementation TwitterTableViewCell

- (void)awakeFromNib {
    
    self.tweetBody.editable = NO;
    self.tweetBody.dataDetectorTypes = UIDataDetectorTypeLink;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
