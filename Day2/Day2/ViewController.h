//
//  ViewController.h
//  Day2
//
//  Created by Faik Catibusic on 10/2/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@property (weak, nonatomic) IBOutlet UILabel *mergedNameLabel;

@end

