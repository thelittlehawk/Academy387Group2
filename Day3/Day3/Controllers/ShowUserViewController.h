//
//  ShowUserViewController.h
//  Day3
//
//  Created by Faik Catibusic on 10/2/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ShowUserViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *showUserLabel;

@property (weak, nonatomic) IBOutlet UILabel *userInformationLabel;

-(void) setupUser:(User*)user;

@end
