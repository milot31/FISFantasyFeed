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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerCell" forIndexPath:indexPath];
    
    Player *selectedPlayer = self.store.team[indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    nameLabel.text = selectedPlayer.fullName;
    
    UILabel *positionLabel = (UILabel *)[cell viewWithTag:2];
    positionLabel.text = selectedPlayer.position;
    
    UILabel *teamLabel = (UILabel *)[cell viewWithTag:3];
    teamLabel.text = selectedPlayer.team;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 69.0;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    FISPlayerFeedTableViewController *destinationVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"playerFeedSegue"]) {
    NSIndexPath *indexPathOfRowTapped = self.tableView.indexPathForSelectedRow;
    Player *playerAtIndex = self.store.team[indexPathOfRowTapped.row];
    destinationVC.player = playerAtIndex;
    }}


@end
