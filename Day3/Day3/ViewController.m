//
//  ViewController.m
//  Day3
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
    self.formHeaderLabel.text = [User className];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveButtonClicked:(id)sender {
    //UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"User created" message:[user getFullName] delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    //[alert show]; // window.alert('Some text');
    
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        ShowUserViewController *controller = (ShowUserViewController*)[segue destinationViewController];
        
        User* user = [[User alloc] initWithFirstName:self.firstNameTextField.text lastName:self.lastNameTextField.text];

        [controller setupUser:user];
    }
}

@end
