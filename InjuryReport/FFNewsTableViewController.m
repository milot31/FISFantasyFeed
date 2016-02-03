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

@interface FFNewsTableViewController ()

@property (nonatomic, strong) NSMutableArray *newsArray;

@end

@implementation FFNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
