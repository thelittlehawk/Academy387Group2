//
//  CreateViewController.h
//  Day5
//
//  Created by Faik Catibusic on 10/6/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "SharedStorage.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface CreateViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@property (weak, nonatomic) IBOutlet UIPickerView *groupPickerView;

@end
