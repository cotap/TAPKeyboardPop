//
//  TAPTextViewViewController.m
//  TAPKeyboardPopExample
//
//  Created by JP Simard on 4/24/14.
//  Copyright (c) 2014 Cotap. All rights reserved.
//

#import "TAPTextViewViewController.h"

@interface TAPTextViewViewController ()

@end

@implementation TAPTextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(endEditing:)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
}

#pragma mark - Actions

- (void)endEditing:(id)sender {
    [self.textView endEditing:YES];
}

@end
