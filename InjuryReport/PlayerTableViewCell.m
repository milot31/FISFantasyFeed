//
//  PlayerTableViewCell.m
//  InjuryReport
//
//  Created by Phil Milot on 1/12/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import "PlayerTableViewCell.h"
#import "FeedStyleKit.h"
#import "Player.h"

@implementation PlayerTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    UIImage *cellGradient = [PlayerTableViewCell imageOfGradient:[FeedStyleKit gradient] size:self.layerView.frame.size];
    self.layerView.backgroundColor = [UIColor colorWithPatternImage:cellGradient];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateLabels:(Player *)player {
    
    NSLog(@"\n\n\n\n UPDATING LABELS \n\n\n\n");
    self.playerNameLabel.text = player.fullName;
    self.playersPositionLabel.text = player.position;
    self.playersTeamLabel.text = player.team;
}

+ (void)drawGradient:(PCGradient *)gradient withFrame:(CGRect)frame
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Rectangle Drawing
    CGRect rectangleRect = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.00000 + 0.5), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.00000 + 0.5), floor(CGRectGetWidth(frame) * 1.00000 + 0.5) - floor(CGRectGetWidth(frame) * 0.00000 + 0.5), floor(CGRectGetHeight(frame) * 1.00000 + 0.5) - floor(CGRectGetHeight(frame) * 0.00000 + 0.5));
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rectangleRect];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient.CGGradient,
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMinY(rectangleRect)),
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMaxY(rectangleRect)),
                                0);
    CGContextRestoreGState(context);
}

+ (UIImage*)imageOfGradient:(PCGradient *)gradient size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    [self drawGradient:gradient withFrame:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* imageOfCanvas2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageOfCanvas2;
}

@end
