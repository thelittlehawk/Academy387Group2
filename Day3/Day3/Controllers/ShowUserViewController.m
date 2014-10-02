//
//  ShowUserViewController.m
//  Day3
//
//  Created by Faik Catibusic on 10/2/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "ShowUserViewController.h"

@interface ShowUserViewController () {
    User* tempUser;
}

@end

@implementation ShowUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.showUserLabel.text = @"User Details";
    self.userInformationLabel.text = [tempUser getFullName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setupUser:(User*)user {
    tempUser = user;
}

@end
