//
//  DetailEntryTableViewController.h
//  Journal - Objective-C - Core Data
//
//  Created by Ross McIlwaine on 5/24/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntryController.h"

@interface DetailEntryTableViewController : UITableViewController

@property (strong, nonatomic) Entry *entry;

@end
