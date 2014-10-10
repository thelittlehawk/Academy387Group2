//
//  SharedStorage.m
//  Day5
//
//  Created by Faik Catibusic on 10/7/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "SharedStorage.h"

@implementation SharedStorage

+ (id)getInstance {
    static SharedStorage *sharedStorage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStorage = [[self alloc] init];
    });
    return sharedStorage;
}

- (id)init {
    if (self = [super init]) {
        self.users = [[NSMutableArray alloc] init];
        // Get Managed Context
        AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
        self->managedObjectContext = appDelegate.managedObjectContext;
    }
    return self;
}

-(void)updateApp {
    [self deleteTableElements];
    
    self.users = [[NSMutableArray alloc] init];
    
    NSString* serverPath = [NSString stringWithFormat:@"http://192.168.1.165:8080/"];
    NSURL* serverUrl = [[NSURL alloc] initWithString:serverPath];
    NSURLResponse* response;
    NSError* error;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:[[NSURLRequest alloc] initWithURL:serverUrl] returningResponse:&response error:&error];

    NSDictionary* usersData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    for (id fetchedUser in usersData) {
        NSString* firstName = [fetchedUser objectForKey:@"firstName"];
        NSString* lastName = [fetchedUser objectForKey:@"lastName"];
        NSString* group = [fetchedUser objectForKey:@"group"];
        
        User* user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self->managedObjectContext];
        user.firstName = firstName;
        user.lastName = lastName;
        user.group = group;
        
        NSError *error;
        if (![self->managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    }
}

-(void)deleteTableElements {
    for (User* user in [self fetchUsersFromDatabase]) {
        [self->managedObjectContext deleteObject:user];
    }
}

-(NSArray*)fetchUsersFromDatabase {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self->managedObjectContext];
    
    NSFetchRequest *request = [[ NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    [request setFetchLimit:7];

    NSError *error;
    NSArray *tripArray = [managedObjectContext executeFetchRequest:request error:&error];
    
    return tripArray;
}

@end