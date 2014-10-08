//
//  SharedStorage.h
//  Day5
//
//  Created by Faik Catibusic on 10/7/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedStorage : NSObject {
    SharedStorage* sharedStorage;
}

+ (id)getInstance;

@property NSMutableArray* users;

@end
