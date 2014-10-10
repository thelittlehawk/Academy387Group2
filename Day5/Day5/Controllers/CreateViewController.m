//
//  CreateViewController.m
//  Day5
//
//  Created by Faik Catibusic on 10/6/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "CreateViewController.h"

@interface CreateViewController () {
    NSArray* groups;
}

@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    groups = [[NSArray alloc] initWithObjects:@"Regular", @"Super", @"Guest", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return groups.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [groups objectAtIndex:row];
}

- (IBAction)saveClicked:(id)sender {
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* managedObjectContext = delegate.managedObjectContext;
    User* user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:managedObjectContext];
    user.firstName = self.firstNameTextField.text;
    user.lastName = self.lastNameTextField.text;
    user.group = [groups objectAtIndex:[self.groupPickerView selectedRowInComponent:0]];

    NSString* formData = [[NSString alloc] initWithFormat:@"firstName=%@&lastName=%@&group=%@", user.firstName, user.lastName, user.group];
    NSData* data = [formData dataUsingEncoding:NSASCIIStringEncoding];
    
    NSString* serverPath = [NSString stringWithFormat:@"http://192.168.1.165:8080/user/"];
    NSURL* serverUrl = [[NSURL alloc] initWithString:serverPath];
 
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:serverUrl];
    [request setHTTPBody:data];
    [request setHTTPMethod:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(connectionError == nil) {
            //[self.navigationController popViewControllerAnimated:NO];
        }
    }];
}

@end
