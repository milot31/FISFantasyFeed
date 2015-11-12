//
//  FISPlayerFeedTableViewController.m
//  InjuryReport
//
//  Created by Phil Milot on 11/9/15.
//  Copyright © 2015 Phil Milot. All rights reserved.
//

#import "FISPlayerFeedTableViewController.h"
#import "FISTweetsDataStore.h"
#import "FFTweetStatus.h"

@interface FISPlayerFeedTableViewController ()

@property (strong, nonatomic) FISTweetsDataStore *tweetStore;


@end

@implementation FISPlayerFeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tweetStore = [FISTweetsDataStore tweetsDataStore];
    [self.tweetStore loadPlayerFeedForPlayer:self.player.fullName withCompletion:^(BOOL success) {
        if (success) {
            
            [self.tableView reloadData];
        }
    }];
}
//
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 90.0;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tweetStore.tweets.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feedCell" forIndexPath:indexPath];
    
    FFTweetStatus *status = self.tweetStore.tweets[indexPath.row];
    UILabel *realNameLabel = (UILabel *)[cell viewWithTag:5];
    realNameLabel.text = status.realName;
    UILabel *twitterHandleLabel = (UILabel *)[cell viewWithTag:1];
    twitterHandleLabel.text = status.twitterHandle;
    UILabel *createdDateLabel = (UILabel *)[cell viewWithTag:2];
    createdDateLabel.text = status.createdDate;
    UILabel *tweetTextLabel = (UILabel *)[cell viewWithTag:3];
    tweetTextLabel.text = status.tweetText;
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        if ( status.imageData == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            //            UIImage *profileImage = (UIImage *)[cell viewWithTag:4];
            UIImage *profileImage = [[UIImage alloc] initWithData:status.imageData];
            cell.imageView.image = profileImage;
            [cell setNeedsLayout];
        });
        
    });

    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
