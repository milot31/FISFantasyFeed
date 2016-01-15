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

-(UIColor *)getAnimationColor:(PlayerTableViewCell *)cell {
    if ([cell.playersTeamLabel.text isEqual:@"BUF"] ||
        [cell.playersTeamLabel.text isEqual:@"NE"] ||
        [cell.playersTeamLabel.text isEqual:@"IND"] ||
        [cell.playersTeamLabel.text isEqual:@"DAL"] ||
        [cell.playersTeamLabel.text isEqual:@"NYG"] ||
        [cell.playersTeamLabel.text isEqual:@"SEA"]) {
        return [UIColor blueColor];
    } else if ([cell.playersTeamLabel.text isEqual:@"MIA"] ||
               [cell.playersTeamLabel.text isEqual:@"CIN"] ||
               [cell.playersTeamLabel.text isEqual:@"CLE"] ||
               [cell.playersTeamLabel.text isEqual:@"DEN"] ||
               [cell.playersTeamLabel.text isEqual:@"CHI"]) {
        return [UIColor orangeColor];
    } else if ([cell.playersTeamLabel.text isEqual:@"NYJ"] ||
               [cell.playersTeamLabel.text isEqual:@"PHI"] ||
               [cell.playersTeamLabel.text isEqual:@"JAC"] ||
               [cell.playersTeamLabel.text isEqual:@"GB"]) {
        return [UIColor greenColor];
    } else if ([cell.playersTeamLabel.text isEqual:@"BAL"] ||
               [cell.playersTeamLabel.text isEqual:@"MIN"]) {
        return [UIColor purpleColor];
    } else if ([cell.playersTeamLabel.text isEqual:@"PIT"] ||
               [cell.playersTeamLabel.text isEqual:@"WAS"] ||
               [cell.playersTeamLabel.text isEqual:@"STL"] ||
               [cell.playersTeamLabel.text isEqual:@"NO"]) {
        return [UIColor yellowColor];
    } else if ([cell.playersTeamLabel.text isEqual:@"HOU"] ||
               [cell.playersTeamLabel.text isEqual:@"KC"] ||
               [cell.playersTeamLabel.text isEqual:@"TB"] ||
               [cell.playersTeamLabel.text isEqual:@"ARI"] ||
               [cell.playersTeamLabel.text isEqual:@"ATL"] ||
               [cell.playersTeamLabel.text isEqual:@"SF"]) {
        return [UIColor redColor];
    } else if ([cell.playersTeamLabel.text isEqual:@"TEN"] ||
               [cell.playersTeamLabel.text isEqual:@"SD"] ||
               [cell.playersTeamLabel.text isEqual:@"DET"] ||
               [cell.playersTeamLabel.text isEqual:@"CAR"]){
        return [UIColor colorWithHue:0.55 saturation:1 brightness:0.96 alpha:1];
    } else {
        return [UIColor blackColor];
    }
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
