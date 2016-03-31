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
#import "Player+CoreDataProperties.h"
#import "Player.h"
#import "PlayerTableViewCell.h"

@interface FISAddPlayerViewController () <UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) NSArray *positionArray;
@property (strong, nonatomic) IBOutlet UIPickerView *positionPickerView;
@property (strong, nonatomic) IBOutlet UITableView *playerTableView;

@property (strong, nonatomic) NSMutableArray *quarterBacks;
@property (strong, nonatomic) NSMutableArray *runningBacks;
@property (strong, nonatomic) NSMutableArray *wideReceivers;
@property (strong, nonatomic) NSMutableArray *tightEnds;
@property (strong, nonatomic) NSMutableArray *kickers;
@property (strong, nonatomic) NSMutableArray *defenses;

@property (strong, nonatomic) NSMutableArray *filteredPlayerArray;
@property (strong, nonatomic) IBOutlet UISearchBar *playerSearchBar;
@property (strong, nonatomic) NSArray *originalArray;


@end

@implementation FISAddPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Add Player";

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
    self.playerSearchBar.delegate = self;
    
    [self initalizeAllTheGroupsToDefaultValue];
    
    self.playerTableView.backgroundColor = [UIColor darkGrayColor];

}

- (void)initalizeAllTheGroupsToDefaultValue {
    self.quarterBacks = [NSMutableArray new];
    self.runningBacks = [NSMutableArray new];
    self.wideReceivers = [NSMutableArray new];
    self.tightEnds = [NSMutableArray new];
    self.kickers = [NSMutableArray new];
    self.defenses = [NSMutableArray new];
    self.playerArray = [NSMutableArray new];
}

#pragma mark pickerView Methods

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    
    [self reloadPlayersBasedOnPickerSelection];

    [self.playerTableView reloadData];
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

#pragma mark tableViewMethods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([self.playerSearchBar.text isEqualToString:@""]) {
        return self.playerArray.count;
    } else {
        return self.filteredPlayerArray.count;
    }
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerCell" forIndexPath:indexPath];
 
     if ([self.playerSearchBar.text isEqualToString: @""]) {
         
         Player *player = self.playerArray[indexPath.row];
         
         cell.playerNameLabel.text = player.fullName;
         cell.playersPositionLabel.text = player.position;
         cell.playersTeamLabel.text = player.team;
         cell.layerAnimationColor = [PlayerTableViewCell getAnimationColor:cell];
         cell.logoView.image = [PlayerTableViewCell getTeamLogo:cell];

     } else {
         
         Player *player = self.filteredPlayerArray[indexPath.row];

         cell.playerNameLabel.text = player.fullName;
         cell.playersPositionLabel.text = player.position;
         cell.playersTeamLabel.text = player.team;
         cell.layerAnimationColor = [PlayerTableViewCell getAnimationColor:cell];
         cell.logoView.image = [PlayerTableViewCell getTeamLogo:cell];

     }
     return cell;
 }

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 69.0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.playerSearchBar.text isEqualToString:@""]) {
        NSManagedObjectContext *objectContext = [FISTeamDataStore sharedDataStore].managedObjectContext;
        Player *selectedPlayer = self.playerArray[indexPath.row];
        Player *newPlayer = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:objectContext];
        newPlayer.fullName = selectedPlayer.fullName;
        newPlayer.team = selectedPlayer.team;
        newPlayer.position = selectedPlayer.position;
        [[FISTeamDataStore sharedDataStore] saveContext];
    } else {
        NSManagedObjectContext *objectContext = [FISTeamDataStore sharedDataStore].managedObjectContext;
        Player *selectedPlayer = self.filteredPlayerArray[indexPath.row];
        Player *newPlayer = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:objectContext];
        newPlayer.fullName = selectedPlayer.fullName;
        newPlayer.team = selectedPlayer.team;
        newPlayer.position = selectedPlayer.position;
        [[FISTeamDataStore sharedDataStore] saveContext];
    }
    
    PlayerTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIImage *cellGradient = [PlayerTableViewCell imageOfGradient:[FeedStyleKit gradient] size:cell.layerView.frame.size];

    [UIView animateKeyframesWithDuration:0.2 delay:0.0 options:nil animations:^{
        cell.layerView.backgroundColor = cell.layerAnimationColor;
    } completion:^(BOOL finished) {
        cell.layerView.backgroundColor = [UIColor colorWithPatternImage:cellGradient];
    }];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark API Methods

-(void)loadQuarterbacks {
    

    if (self.quarterBacks.count == 0) {
        
        [FFFantasyAPIClient getActiveQBPlayersWithCompletion:^(NSDictionary *quarterBacks, NSError *qbError) {
            
            if (qbError) {
                NSLog(@"%@", qbError);
                //ALERT CONTROLLER
                
            } else {
            
                for (NSDictionary *player in quarterBacks[@"Players"]) {
                    FISPlayer *newPlayer = [[FISPlayer alloc]init];
                    newPlayer.fullName = player[@"displayName"];
                    newPlayer.position = player[@"position"];
                    newPlayer.team = player[@"team"];
                    [self.quarterBacks addObject:newPlayer];
                    
                }
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                    self.playerArray = self.quarterBacks;
                    [self.playerTableView reloadData];
                }];
            }
        }];
    } else {
        self.playerArray = self.quarterBacks;
        self.originalArray = self.playerArray;
    }
}

-(void)loadRunningbacks {
    
    if (self.runningBacks.count == 0) {
    
        [FFFantasyAPIClient getActiveRBPlayersWithCompletion:^(NSDictionary *runningBacks, NSError *rbError) {
            
            if (rbError) {
                //ALERT CONTROLLER
            } else {
            
                for (NSDictionary *player in runningBacks[@"Players"]) {
                    FISPlayer *newPlayer = [[FISPlayer alloc]init];
                    newPlayer.fullName = player[@"displayName"];
                    newPlayer.position = player[@"position"];
                    newPlayer.team = player[@"team"];
                    [self.runningBacks addObject:newPlayer];
                }
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    self.playerArray = self.runningBacks;
                    [self.playerTableView reloadData];
                }];
            }
        }];
    } else {
        self.playerArray = self.runningBacks;
        self.originalArray = self.playerArray;
    }
}

-(void)loadWideReceivers {
    
    if (self.wideReceivers.count == 0) {
    
        [FFFantasyAPIClient getActiveWRPlayersWithCompletion:^(NSDictionary *wideReceivers, NSError *wrError) {
            
            if (wrError) {
                //ALERT CONTROLLER
            } else {
            
                for (NSDictionary *player in wideReceivers[@"Players"]) {
                    FISPlayer *newPlayer = [[FISPlayer alloc]init];
                    newPlayer.fullName = player[@"displayName"];
                    newPlayer.position = player[@"position"];
                    newPlayer.team = player[@"team"];
                    [self.wideReceivers addObject:newPlayer];
                }
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    self.playerArray = self.wideReceivers;
                    [self.playerTableView reloadData];
                }];
            }
        }];
    } else {
        self.playerArray = self.wideReceivers;
        self.originalArray = self.playerArray;
    }
}

-(void)loadTightEnds {
    
    if (self.tightEnds.count == 0) {
    
        [FFFantasyAPIClient getActiveTEPlayersWithCompletion:^(NSDictionary *tightEnds, NSError *teError) {
            
            if (teError) {
                //ALERT CONTROLLER
            } else {
            
                for (NSDictionary *player in tightEnds[@"Players"]) {
                    FISPlayer *newPlayer = [[FISPlayer alloc]init];
                    newPlayer.fullName = player[@"displayName"];
                    newPlayer.position = player[@"position"];
                    newPlayer.team = player[@"team"];
                    [self.tightEnds addObject:newPlayer];
                }
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    self.playerArray = self.tightEnds;
                    [self.playerTableView reloadData];
                }];
            }
        }];
    } else {
        self.playerArray = self.tightEnds;
        self.originalArray = self.playerArray;
    }
}

-(void)loadKickers {
    
    if (self.kickers.count == 0) {
    
        [FFFantasyAPIClient getActiveKPlayersWithCompletion:^(NSDictionary *kickers, NSError *kError) {
            
            if (kError) {
                //ALERT CONTROLLER
            } else {
            
                for (NSDictionary *player in kickers[@"Players"]) {
                    FISPlayer *newPlayer = [[FISPlayer alloc]init];
                    newPlayer.fullName = player[@"displayName"];
                    newPlayer.position = player[@"position"];
                    newPlayer.team = player[@"team"];
                    [self.kickers addObject:newPlayer];
                }
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    self.playerArray = self.kickers;
                    [self.playerTableView reloadData];
                }];
            }
        }];
    } else {
        self.playerArray = self.kickers;
        self.originalArray = self.playerArray;
    }
}

-(void)loadDefense {
    
    if (self.defenses.count == 0) {
    
        [FFFantasyAPIClient getActiveDEFPlayersWithCompletion:^(NSDictionary *defenses, NSError *defError) {
            
            if (defError) {
                //ALERT CONTROLLER
            } else {
                
                for (NSDictionary *player in defenses[@"Players"]) {
                    FISPlayer *newPlayer = [[FISPlayer alloc]init];
                    newPlayer.fullName = player[@"displayName"];
                    newPlayer.position = player[@"position"];
                    newPlayer.team = player[@"team"];
                    [self.defenses addObject:newPlayer];
                }
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    self.playerArray = self.defenses;
                    [self.playerTableView reloadData];
                }];
            }
        }];
    } else {
        self.playerArray = self.defenses;
        self.originalArray = self.playerArray;
    }
}

#pragma mark searchBar Methods

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    if ([searchText isEqualToString:@""]) {
        self.filteredPlayerArray = self.originalArray;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.fullName contains[c] %@", searchText];
    self.filteredPlayerArray = [NSMutableArray arrayWithArray:[self.playerArray filteredArrayUsingPredicate:predicate]];
    
    [self.playerTableView reloadData];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    searchBar.text = [NSString stringWithFormat:@""];
    self.filteredPlayerArray = self.originalArray;
    [self.playerTableView reloadData];
    [searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"search button clicked");
    [searchBar resignFirstResponder];

}

#pragma mark miscellaneous methods

- (IBAction)cancelButtonTapper:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
