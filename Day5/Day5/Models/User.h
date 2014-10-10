//
//  User.h
//  Day5
//
//  Created by Faik Catibusic on 10/9/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property NSString * firstName;

@property NSString * lastName;

@property NSString * group;

-(id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName group:(NSString*)group;

-(NSString*)getFullName;

@end
