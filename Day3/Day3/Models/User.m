//
//  User.m
//  Day3
//
//  Created by Faik Catibusic on 10/2/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "User.h"

@implementation User

-(User*)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName {
    self.firstName = firstName;
    self.lastName = lastName;
    return self;
}

-(NSString*) getFullName {
    NSString* fullName = [[NSString alloc] initWithFormat:@"%@, %@", self.firstName, self.lastName];
    return fullName;
}

+(NSString*) className {
    return @"User Class";
}

@end
