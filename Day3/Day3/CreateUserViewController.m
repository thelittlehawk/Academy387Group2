//
//  ViewController.m
//  Day3
//
//  Created by Faik Catibusic on 10/2/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "CreateUserViewController.h"

@interface CreateUserViewController ()

@end

@implementation CreateUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Set header lable text to the name of User class
    self.formHeaderLabel.text = [User className];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveButtonClicked:(id)sender {
    // UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"User created" message:[user getFullName] delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    // [alert show]; // window.alert('Some text');
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        User* user = [[User alloc] initWithFirstName:self.firstNameTextField.text lastName:self.lastNameTextField.text];
        
        ShowUserViewController *controller = (ShowUserViewController*)[segue destinationViewController];
        [controller setupUser:user];
    }
}

@end
