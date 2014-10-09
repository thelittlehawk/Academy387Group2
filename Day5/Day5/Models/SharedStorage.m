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
    }
    return self;
}

-(void)updateApp {
    self.users = [[NSMutableArray alloc] init];
    
    NSString* serverPath = [NSString stringWithFormat:@"http://192.168.224.95:8080/"];
    NSURL* serverUrl = [[NSURL alloc] initWithString:serverPath];
    NSURLResponse* response;
    NSError* error;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:[[NSURLRequest alloc] initWithURL:serverUrl] returningResponse:&response error:&error];

    NSDictionary* usersData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    for (id fetchedUser in usersData) {
        NSString* firstName = [fetchedUser objectForKey:@"firstName"];
        NSString* lastName = [fetchedUser objectForKey:@"lastName"];
        NSString* group = [fetchedUser objectForKey:@"group"];
        
        User* user = [[User alloc] initWithFirstName:firstName lastName:lastName group:group];
        [self.users addObject:user];
    }
    
    /*
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:serverUrl] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSError* error;
        NSDictionary* usersData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        for (id fetchedUser in usersData) {
            NSString* firstName = [fetchedUser objectForKey:@"firstName"];
            NSString* lastName = [fetchedUser objectForKey:@"lastName"];
            NSString* group = [fetchedUser objectForKey:@"group"];
            
            User* user = [[User alloc] initWithFirstName:firstName lastName:lastName group:group];
            [self.users addObject:user];
        }
        
    }];
     */
}

@end