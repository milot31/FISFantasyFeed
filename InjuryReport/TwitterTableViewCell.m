//
//  TwitterTableViewCell.m
//  InjuryReport
//
//  Created by Phil Milot on 2/5/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import "TwitterTableViewCell.h"

//@interface TwitterTableViewCell () <UITextViewDelegate>
//
//@end

@implementation TwitterTableViewCell 

- (void)awakeFromNib {
    
    //self.tweetBody.delegate = self;
    self.tweetBody.editable = NO;
    self.tweetBody.dataDetectorTypes = UIDataDetectorTypeLink;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
//    
//}

@end
