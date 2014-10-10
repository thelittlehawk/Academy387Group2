//
//  User.m
//  Day5
//
//  Created by Faik Catibusic on 10/9/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "User.h"


@implementation User

@dynamic firstName;

@dynamic lastName;

@dynamic group;

-(id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName group:(NSString*)group {
    if(self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.group = group;
    }
    return self;
}

-(NSString*)getFullName {
    NSString* fullName = [[NSString alloc] initWithFormat:@"%@, %@", self.firstName, self.lastName];
    return fullName;
}

@end
