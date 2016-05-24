//
//  DetailEntryTableViewController.m
//  Journal - Objective-C - Core Data
//
//  Created by Ross McIlwaine on 5/24/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

#import "DetailEntryTableViewController.h"

@interface DetailEntryTableViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextField;

@end

@implementation DetailEntryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateWithEntry:self.entry];
}

- (void)updateWithEntry:(Entry *)entry
{
    if (entry)
    {
        self.entry = entry;
        self.titleTextField.text = entry.title;
        self.bodyTextField.text = entry.body;
        self.navigationItem.title = entry.title;
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    
    if (self.entry)
    {
        self.entry.title = self.titleTextField.text;
        self.entry.body = self.bodyTextField.text;
        self.entry.timestamp = [NSDate date];
        
        [[EntryController sharedInstance] synchronize];

    } else {
        self.entry = [[EntryController sharedInstance] addEntryWithTitle:self.titleTextField.text body:self.bodyTextField.text];
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(id)sender {
    
    self.titleTextField.text = @"";
    self.bodyTextField.text = @"";
}

#pragma mark - TextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

@end
