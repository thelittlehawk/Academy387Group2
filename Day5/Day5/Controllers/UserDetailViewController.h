//
//  UserDetailViewController.h
//  Day5
//
//  Created by Faik Catibusic on 10/6/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

-(void)setUsername:(NSString*)username;

@end