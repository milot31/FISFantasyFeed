//
//  PlayerTableViewCell.h
//  InjuryReport
//
//  Created by Phil Milot on 1/12/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *positionLabel;
@property (strong, nonatomic) IBOutlet UILabel *playersPositionLabel;
@property (strong, nonatomic) IBOutlet UILabel *teamLabel;
@property (strong, nonatomic) IBOutlet UILabel *playersTeamLabel;
@property (strong, nonatomic) IBOutlet UIImageView *logoView;



@end
