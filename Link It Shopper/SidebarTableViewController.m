//
//  SidebarTableViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "SidebarTableViewController.h"
#import "ViewController.h"

@interface SidebarTableViewController ()

@end

@implementation SidebarTableViewController {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // This will remove extra separators from tableview
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    NSString *identifier = [NSString stringWithFormat:@"menu_%d",index];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *navController = segue.destinationViewController;
    ViewController *nextController = [navController childViewControllers].firstObject;
    NSString *title = @"My Likes";
    if (indexPath.row == 2){
        title = @"My Merchants";
    } else if (indexPath.row == 3){
        title = @"Featured Merchants";
    }
    [nextController setTitle: title];
    
    if(indexPath.row == 4){
        [nextController setNeedToLogout:YES];
    }
}

@end
