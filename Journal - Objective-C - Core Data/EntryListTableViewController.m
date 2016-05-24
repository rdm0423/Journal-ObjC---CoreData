//
//  EntryListTableViewController.m
//  Journal - Objective-C - Core Data
//
//  Created by Ross McIlwaine on 5/24/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "DetailEntryTableViewController.h"
#import "EntryController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[EntryController sharedInstance].entries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
    
    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
    cell.textLabel.text = entry.title;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"toDetailSegue"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
        DetailEntryTableViewController *detailTBV = segue.destinationViewController;
        detailTBV.entry = entry;
    }
    
}


@end
