//
//  EntryController.m
//  Journal - Objective-C - Core Data
//
//  Created by Ross McIlwaine on 5/24/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import "EntryController.h"
#import "Stack.h"

static NSString * const AllEntriesKey = @"allEntries";

@implementation EntryController


-(Entry *)addEntryWithTitle:(NSString *)title body:(NSString *)body {
    
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    entry.title = title;
    entry.body = body;
    entry.timestamp = [NSDate date];
    
    [self synchronize];
    
    return entry;
}

-(void)removeEntry:(Entry *)entry
{
    [entry.managedObjectContext deleteObject:entry];
    [self synchronize];
}

-(void)synchronize
{
    [[Stack sharedInstance].managedObjectContext save:NULL];
}

-(NSArray *)entries
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    NSArray *fetchedObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return fetchedObjects;
}

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    return sharedInstance;
}

@end
