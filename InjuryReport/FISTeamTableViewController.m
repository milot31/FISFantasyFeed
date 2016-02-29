//
//  FISTeamTableViewController.m
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FISTeamTableViewController.h"
#import "FISTeamDataStore.h"
#import "FISPlayer.h"
#import "FISTweetsDataStore.h"
#import "PlayerTableViewCell.h"
#import "FeedStyleKit.h"


@interface FISTeamTableViewController ()

@property (nonatomic, strong) FISTeamDataStore *store;
@property (nonatomic, strong) FISTweetsDataStore  *tweetStore;

@end

@implementation FISTeamTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.store = [FISTeamDataStore sharedDataStore];
    [[FISTeamDataStore sharedDataStore] fetchData];
    self.tweetStore = [FISTweetsDataStore tweetsDataStore];
    [self.tweetStore.tweets removeAllObjects];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [[FISTeamDataStore sharedDataStore] fetchData];
    [self.tableView reloadData];
    [self.tweetStore.tweets removeAllObjects];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObjectContext *objectContext = [FISTeamDataStore sharedDataStore].managedObjectContext;
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [objectContext deleteObject:[self.store.team objectAtIndex:indexPath.row]];
        NSError *error = nil;
        if (![objectContext save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        [self.store.team removeObjectAtIndex:indexPath.row];
        [[FISTeamDataStore sharedDataStore] fetchData];
        [self.tableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.store.team.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerCell" forIndexPath:indexPath];
    
    Player *selectedPlayer = self.store.team[indexPath.row];
    
    cell.playerNameLabel.text = selectedPlayer.fullName;
    cell.playersPositionLabel.text = selectedPlayer.position;
    cell.playersTeamLabel.text = selectedPlayer.team;
    cell.layerAnimationColor = [PlayerTableViewCell getAnimationColor:cell];
    cell.logoView.image = [PlayerTableViewCell getTeamLogo:cell];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PlayerTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIImage *cellGradient = [PlayerTableViewCell imageOfGradient:[FeedStyleKit gradient] size:cell.layerView.frame.size];

    [UIView animateKeyframesWithDuration:0.2 delay:0.0 options:nil animations:^{
        cell.layerView.backgroundColor = cell.layerAnimationColor;
    } completion:^(BOOL finished) {
        cell.layerView.backgroundColor = [UIColor colorWithPatternImage:cellGradient];
    }];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 69.0;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    FISPlayerFeedTableViewController *destinationVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"playerFeedSegue"]) {
    NSIndexPath *indexPathOfRowTapped = self.tableView.indexPathForSelectedRow;
    Player *playerAtIndex = self.store.team[indexPathOfRowTapped.row];
    destinationVC.player = playerAtIndex;
    }}


@end
