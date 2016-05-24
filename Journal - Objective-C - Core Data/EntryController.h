//
//  EntryController.h
//  Journal - Objective-C - Core Data
//
//  Created by Ross McIlwaine on 5/24/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+ (EntryController *)sharedInstance;

-(Entry *)addEntryWithTitle:(NSString *)title body:(NSString *)body ;
-(void)removeEntry:(Entry *)entry;

-(void)synchronize;

@end
