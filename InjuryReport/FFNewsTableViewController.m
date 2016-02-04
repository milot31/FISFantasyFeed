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

@interface FFNewsTableViewController ()

@property (nonatomic, strong) NSMutableArray *newsArray;

@end

@implementation FFNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView reloadData];
    
    self.newsArray = [@[] mutableCopy];
    
    [FFRotoNewsAPI getNewsWithCompletion:^(NSArray *rotoNewsArray) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            for (NSDictionary *dict in rotoNewsArray) {
                FFNewsArticle *new = [FFNewsArticle newsFromDictionary:dict];
                [self.newsArray addObject:new];
            }
            [self.tableView reloadData];
        }];
    }];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)refresh:(UIRefreshControl *)sender {
    self.newsArray = [@[] mutableCopy];
    
    [FFRotoNewsAPI getNewsWithCompletion:^(NSArray *rotoNewsArray) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            for (NSDictionary *dict in rotoNewsArray) {
                FFNewsArticle *new = [FFNewsArticle newsFromDictionary:dict];
                [self.newsArray addObject:new];
            }
            [self.tableView reloadData];
            [sender endRefreshing];
        }];
    }];
}


@end
