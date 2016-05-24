//
//  Entry+CoreDataProperties.h
//  Journal - Objective-C - Core Data
//
//  Created by Ross McIlwaine on 5/24/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface Entry (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *body;
@property (nullable, nonatomic, retain) NSDate *timestamp;

@end

NS_ASSUME_NONNULL_END
