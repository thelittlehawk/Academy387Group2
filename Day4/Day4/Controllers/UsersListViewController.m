//
//  UsersListViewController.m
//  Day4
//
//  Created by Faik Catibusic on 10/3/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "UsersListViewController.h"

@interface UsersListViewController () {
    NSArray *users;
    NSArray *students;
}

@end

@implementation UsersListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Init users array
    users = [[NSArray alloc] initWithObjects:@"User 1", @"User 2", @"User 3", @"User 4", nil];
    students = [[NSArray alloc] initWithObjects:@"Student 1", @"Student 2", @"Student 3", @"Student 4", @"Student 5", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return @"Users";
    } else if(section == 1) {
        return @"Students";
    }
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return [users count];
    } else if(section == 1) {
        return [students count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* userName;
    if([indexPath section] == 0) {
        userName = [users objectAtIndex:indexPath.row];
    } else if([indexPath section] == 1) {
        userName = [students objectAtIndex:indexPath.row];
    }
    
    NSArray* userNameSplited = [userName componentsSeparatedByString:@" "];
    
    UITableViewCell* cell;
    if ([[userNameSplited objectAtIndex:1] intValue] % 2 == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"userCellOne"];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"userCellTwo"];
    }
    cell.textLabel.text = userName;
    
    return cell;
}

@end
