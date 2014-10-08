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

@end