//
//  User.h
//  Day3
//
//  Created by Faik Catibusic on 10/2/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString* firstName;

@property NSString* lastName;

-(User*)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName;

-(NSString*) getFullName;

+(NSString*) className;

@end
