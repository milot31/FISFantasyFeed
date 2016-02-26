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
#import <FontAwesomeKit/FontAwesomeKit.h>
#import "TwitterTableViewCell.h"
#import <SafariServices/SafariServices.h>
#import "FeedStyleKit.h"


@interface FISPlayerFeedTableViewController () <UINavigationBarDelegate, UINavigationControllerDelegate, UITextViewDelegate>

@property (strong, nonatomic) FISTweetsDataStore *tweetStore;
@property (strong, nonatomic) IBOutlet UINavigationItem *navBar;
- (IBAction)refresh:(UIRefreshControl *)sender;
@property (strong, nonatomic) IBOutlet UIImageView *noTweetImage;

@end

@implementation FISPlayerFeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect orig = self.noTweetImage.frame;
    CGRect temp = self.noTweetImage.frame;
    temp.size.height = 20;
    
    self.noTweetImage.frame = temp;
    [self.noTweetImage setImage:[FeedStyleKit imageOfLoading]];
    self.noTweetImage.hidden = NO;
    
    self.tweetStore = [FISTweetsDataStore tweetsDataStore];
    [self.tweetStore loadPlayerFeedForPlayer:self.player.fullName fromTeam:self.player.team withCompletion:^(BOOL success) {
        if (success) {
            
            [self.tableView reloadData];
            
            if (self.tweetStore.tweets.count == 0) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.noTweetImage setImage:[FeedStyleKit imageOfCanvas3]];
                    self.noTweetImage.frame = orig;
                    self.noTweetImage.hidden = NO;
                }];
            } else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    self.noTweetImage.hidden = YES;
                }];
            }
        }
    }];
    
    //self.navigationController.navigationBar.tintColor = [UIColor colorWithHue:0.33 saturation:1 brightness:0.33 alpha:1];
    
    self.navBar.title = [NSString stringWithFormat:@"%@", self.player.fullName];
    
    //self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    //[self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor blackColor]}];

    
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static TwitterTableViewCell *cell = nil;
//    static dispatch_once_t onceToken;
//    
//    dispatch_once(&onceToken, ^{
//        cell = [self.tableView dequeueReusableCellWithIdentifier:@"feedCell"];
//    });
//    
//    return [self calculateHeightForConfiguredSizingCell:cell];
    return 125.5;
}

//- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
//
//    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    return size.height;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TwitterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feedCell" forIndexPath:indexPath];
    
    FFTweetStatus *status = self.tweetStore.tweets[indexPath.row];
    
    if (status.isRetweet == YES) {
        cell.retweetLabel.hidden = NO;
        cell.retweetLabel.text = [NSString stringWithFormat:@"retweeted from: %@", status.retweetHandle];
    } else {
        cell.retweetLabel.hidden = YES;
    }
    
    cell.displayName.text = status.realName;
    [cell.displayName sizeToFit];
    
    cell.twitterHandle.text = status.twitterHandle;
    [cell.twitterHandle sizeToFit];
    
    cell.timePosted.text = status.createdDate;
    
    cell.tweetBody.text = status.tweetText;
    cell.tweetBody.delegate = self;
    //NSLog(@"%@", cell.tweetBody.text);
    
//    [cell.tweetBody sizeToFit];
//    [cell.tweetBody layoutIfNeeded];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        if ( status.imageData == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *profileImage = [[UIImage alloc] initWithData:status.imageData];
            cell.twitterAvi.image = profileImage;
            //[cell setNeedsLayout];
        });
        
    });

    // Configure the cell...
    
    return cell;
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    SFSafariViewController *sfvc = [[SFSafariViewController alloc]initWithURL:URL entersReaderIfAvailable:YES];
    [sfvc setModalPresentationStyle:UIModalTransitionStylePartialCurl];
    [self presentViewController:sfvc animated:YES completion:nil];
    return NO;
}



- (IBAction)refresh:(UIRefreshControl *)sender {
    [self.tweetStore loadPlayerFeedForPlayer:self.player.fullName fromTeam:self.player.team withCompletion:^(BOOL success) {
        if (success) {
            
            [self.tableView reloadData];
        }
        [sender endRefreshing];
    }];
}

- (IBAction)backButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
