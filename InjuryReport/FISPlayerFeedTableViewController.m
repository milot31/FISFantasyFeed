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


@interface FISPlayerFeedTableViewController () <UINavigationBarDelegate, UINavigationControllerDelegate, UITextViewDelegate>

@property (strong, nonatomic) FISTweetsDataStore *tweetStore;
@property (strong, nonatomic) IBOutlet UINavigationItem *navBar;
- (IBAction)refresh:(UIRefreshControl *)sender;


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
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithHue:0.33 saturation:1 brightness:0.33 alpha:1];
    
    self.navBar.title = [NSString stringWithFormat:@"%@", self.player.fullName];
    
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
    return 125.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TwitterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feedCell" forIndexPath:indexPath];
    
    FFTweetStatus *status = self.tweetStore.tweets[indexPath.row];
    cell.displayName.text = status.realName;
    
    cell.twitterHandle.text = status.twitterHandle;
    
    cell.timePosted.text = status.createdDate;
    
    cell.tweetBody.text = status.tweetText;
    cell.tweetBody.delegate = self;
    
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
    [self.tweetStore loadPlayerFeedForPlayer:self.player.fullName withCompletion:^(BOOL success) {
        if (success) {
            
            [self.tableView reloadData];
        }
        [sender endRefreshing];
    }];
}
@end
