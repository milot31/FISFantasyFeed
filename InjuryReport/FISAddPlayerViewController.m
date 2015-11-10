//
//  FISAddPlayerViewController.m
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FISAddPlayerViewController.h"
#import "FFFantasyAPIClient.h"
#import "FISPlayer.h"

@interface FISAddPlayerViewController () <UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *positionArray;
@property (strong, nonatomic) IBOutlet UIPickerView *positionPickerView;
@property (strong, nonatomic) IBOutlet UITableView *playerTableView;

@end

@implementation FISAddPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.positionArray = @[ @"-",
                            @"Quarterback",
                            @"Runningback",
                            @"Wide Receiver",
                            @"Tight End",
                            @"Kicker",
                            @"Defense"];
    
    self.positionPickerView.delegate = self;
    self.positionPickerView.dataSource = self;
    self.playerTableView.delegate = self;
    self.playerTableView.dataSource = self;
    

}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.positionArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [self.positionArray objectAtIndex:row];
}

- (void)reloadPlayersBasedOnPickerSelection {
    
    NSString *activePickerSelection = [self.positionArray objectAtIndex:[self.positionPickerView selectedRowInComponent:0]];
    if ([activePickerSelection isEqualToString:self.positionArray[1]]) {
        [self loadQuarterbacks];
    } else if ([activePickerSelection isEqualToString:self.positionArray[2]]) {
        [self loadRunningbacks];
    } else if ([activePickerSelection isEqualToString:self.positionArray[3]]) {
        [self loadWideReceivers];
    } else if ([activePickerSelection isEqualToString:self.positionArray[4]]) {
        [self loadTightEnds];
    } else if ([activePickerSelection isEqualToString:self.positionArray[5]]) {
        [self loadKickers];
    } else if ([activePickerSelection isEqualToString:self.positionArray[6]]) {
        [self loadDefense];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playerArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self reloadPlayersBasedOnPickerSelection];
    [self.playerTableView reloadData];
}

//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)loadQuarterbacks {
    
    self.playerArray = [[NSMutableArray alloc]init];
    
    [FFFantasyAPIClient getActiveQBPlayersWithCompletion:^(NSDictionary *quarterBacks) {
        for (NSDictionary *player in quarterBacks[@"Player"]) {
            FISPlayer *newPlayer = [[FISPlayer alloc]init];
            newPlayer.fullName = player[@"displayName"];
            newPlayer.position = player[@"position"];
            newPlayer.team = player[@"team"];
            [self.playerArray addObject:newPlayer];
        }
    }];
}

-(void)loadRunningbacks {
    
    self.playerArray = [[NSMutableArray alloc]init];
    
    [FFFantasyAPIClient getActiveRBPlayersWithCompletion:^(NSDictionary *runningBacks) {
        for (NSDictionary *player in runningBacks[@"Player"]) {
            FISPlayer *newPlayer = [[FISPlayer alloc]init];
            newPlayer.fullName = player[@"displayName"];
            newPlayer.position = player[@"position"];
            newPlayer.team = player[@"team"];
            [self.playerArray addObject:newPlayer];
        }
    }];
}

-(void)loadWideReceivers {
    
    self.playerArray = [[NSMutableArray alloc]init];
    
    [FFFantasyAPIClient getActiveWRPlayersWithCompletion:^(NSDictionary *wideReceivers) {
        for (NSDictionary *player in wideReceivers[@"Player"]) {
            FISPlayer *newPlayer = [[FISPlayer alloc]init];
            newPlayer.fullName = player[@"displayName"];
            newPlayer.position = player[@"position"];
            newPlayer.team = player[@"team"];
            [self.playerArray addObject:newPlayer];
        }
    }];
}

-(void)loadTightEnds {
    
    self.playerArray = [[NSMutableArray alloc]init];
    
    [FFFantasyAPIClient getActiveTEPlayersWithCompletion:^(NSDictionary *tightEnds) {
        for (NSDictionary *player in tightEnds[@"Player"]) {
            FISPlayer *newPlayer = [[FISPlayer alloc]init];
            newPlayer.fullName = player[@"displayName"];
            newPlayer.position = player[@"position"];
            newPlayer.team = player[@"team"];
            [self.playerArray addObject:newPlayer];
        }
    }];
}

-(void)loadKickers {
    
    self.playerArray = [[NSMutableArray alloc]init];
    
    [FFFantasyAPIClient getActiveKPlayersWithCompletion:^(NSDictionary *kickers) {
        for (NSDictionary *player in kickers[@"Player"]) {
            FISPlayer *newPlayer = [[FISPlayer alloc]init];
            newPlayer.fullName = player[@"displayName"];
            newPlayer.position = player[@"position"];
            newPlayer.team = player[@"team"];
            [self.playerArray addObject:newPlayer];
        }
    }];
}

-(void)loadDefense {
    
    self.playerArray = [[NSMutableArray alloc]init];
    
    [FFFantasyAPIClient getActiveDEFPlayersWithCompletion:^(NSDictionary *defenses) {
        for (NSDictionary *player in defenses[@"Player"]) {
            FISPlayer *newPlayer = [[FISPlayer alloc]init];
            newPlayer.fullName = player[@"displayName"];
            newPlayer.position = player[@"position"];
            newPlayer.team = player[@"team"];
            [self.playerArray addObject:newPlayer];
        }
    }];
}

@end
