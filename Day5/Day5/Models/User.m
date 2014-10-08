//
//  User.m
//  Day5
//
//  Created by Faik Catibusic on 10/6/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "User.h"

@implementation User

-(NSString*)getFullName {
    NSString* fullName = [[NSString alloc] initWithFormat:@"%@, %@ :: %@", self.firstName, self.lastName, self.group, nil];
    return fullName;
}

@end
