//
//  FFNewsTableViewController.m
//  InjuryReport
//
//  Created by Phil Milot on 2/1/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import "FFNewsTableViewController.h"
#import "FFRotoNewsAPI.h"
#import "FFNewsArticle.h"
#import <SafariServices/SafariServices.h>
#import "FeedStyleKit.h"

@interface FFNewsTableViewController ()

@property (nonatomic, strong) NSMutableArray *newsArray;
@property (strong, nonatomic) IBOutlet UIImageView *loadingImage;


@end

@implementation FFNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView reloadData];
    
    self.newsArray = [NSMutableArray new];
    
    [self.loadingImage setImage:[FeedStyleKit imageOfLoading]];
    self.loadingImage.hidden = NO;
    
    [FFRotoNewsAPI getNewsWithCompletion:^(NSArray *rotoNewsArray) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            for (NSDictionary *dict in rotoNewsArray) {
                FFNewsArticle *new = [FFNewsArticle newsFromDictionary:dict];
                [self.newsArray addObject:new];
                self.loadingImage.hidden = YES;
            }
            [self.tableView reloadData];
        }];
    }];
    
    self.refreshControl.tintColor = [UIColor whiteColor];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
    
        FFNewsArticle *new = self.newsArray[indexPath.row];
        
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
        titleLabel.text = new.title;
        
        UILabel *siteLabel = (UILabel *)[cell viewWithTag:2];
        siteLabel.text = new.site;
        
        UILabel *dateLabel = (UILabel *)[cell viewWithTag:3];
        dateLabel.text = new.date;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FFNewsArticle *news = self.newsArray[indexPath.row];
    SFSafariViewController *sfvc = [[SFSafariViewController alloc]initWithURL:news.url entersReaderIfAvailable:YES];
    [sfvc setModalPresentationStyle:UIModalTransitionStylePartialCurl];
    [self presentViewController:sfvc animated:YES completion:nil];
}

- (IBAction)refresh:(UIRefreshControl *)sender {
    NSMutableArray *newArray = [NSMutableArray new];
    
    [FFRotoNewsAPI getNewsWithCompletion:^(NSArray *rotoNewsArray) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            for (NSDictionary *dict in rotoNewsArray) {
                FFNewsArticle *new = [FFNewsArticle newsFromDictionary:dict];
                [newArray addObject:new];
            }
            self.newsArray = newArray;
            [self.tableView reloadData];
            [sender endRefreshing];
        }];
    }];
}


@end
