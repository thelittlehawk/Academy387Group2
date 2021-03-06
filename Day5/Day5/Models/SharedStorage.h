//
//  SharedStorage.h
//  Day5
//
//  Created by Faik Catibusic on 10/7/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "User.h"

@interface SharedStorage : NSObject {
    SharedStorage* sharedStorage;
    NSManagedObjectContext *managedObjectContext;
}

@property NSMutableArray* users;

+ (id)getInstance;

-(void)updateApp;

-(NSArray*)fetchUsersFromDatabase;

@end
