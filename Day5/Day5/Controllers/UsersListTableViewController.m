//
//  UsersListTableViewController.m
//  Day5
//
//  Created by Faik Catibusic on 10/6/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "UsersListTableViewController.h"

@interface UsersListTableViewController () {
    NSArray* users;
    SharedStorage* storage;
}

@end

@implementation UsersListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    storage = [SharedStorage getInstance];
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
    return storage.users.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
    
    User* user = [storage.users objectAtIndex:indexPath.row];
    cell.textLabel.text = user.firstName;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"userDetail"]) {
         UserDetailViewController* controller = (UserDetailViewController*) [segue destinationViewController];
        
        User* selectedUser = [storage.users objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        NSString* username = selectedUser.firstName;
        
        [controller setUsername:selectedUser];
    }
}

@end
