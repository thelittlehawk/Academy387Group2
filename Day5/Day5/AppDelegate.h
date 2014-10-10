//
//  AppDelegate.h
//  Day5
//
//  Created by Faik Catibusic on 10/6/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) NSManagedObjectModel *managedObjectModel;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

