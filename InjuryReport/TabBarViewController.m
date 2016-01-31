//
//  TabBarViewController.m
//  InjuryReport
//
//  Created by Phil Milot on 1/31/16.
//  Copyright © 2016 Phil Milot. All rights reserved.
//

#import "TabBarViewController.h"
#import "FeedStyleKit.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setTintColor:[UIColor greenColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    
    UITabBarItem *tabBarItem1 = [self.tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [self.tabBar.items objectAtIndex:1];
    
    tabBarItem1.title = @"My Team";
    tabBarItem2.title = @"News";
    
    tabBarItem1.image = [FeedStyleKit imageOfCanvas1];
    tabBarItem2.image = [FeedStyleKit imageOfCanvas2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
