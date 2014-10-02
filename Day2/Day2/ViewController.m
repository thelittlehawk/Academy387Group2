//
//  ViewController.m
//  Day2
//
//  Created by Faik Catibusic on 10/2/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Collect first and last name from text fields, and than display it in label merged.
- (IBAction)mergeButtonClicked:(id)sender {
    NSString* firstName = self.firstNameTextField.text;
    NSString* lastName = self.lastNameTextField.text;
    
    NSString* fullName = [NSString stringWithFormat:@"%@, %@", firstName, lastName];
    
    self.mergedNameLabel.text = fullName;
}

// Close keyboard if user press "Return" button
- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
