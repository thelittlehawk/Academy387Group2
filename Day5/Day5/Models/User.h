//
//  User.h
//  Day5
//
//  Created by Faik Catibusic on 10/6/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString* firstName;

@property NSString* lastName;

@property NSString* group;

-(NSString*)getFullName;

@end
