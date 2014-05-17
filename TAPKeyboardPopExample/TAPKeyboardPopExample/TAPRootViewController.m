#import "TAPRootViewController.h"
#import "TAPTextFieldViewController.h"
#import "TAPTextViewViewController.h"

@interface TAPRootViewController ()

@end

@implementation TAPRootViewController

- (IBAction)tappedTextFieldButton:(id)sender
{
    TAPTextFieldViewController *vc = [[TAPTextFieldViewController alloc] initWithNibName:@"TAPTextFieldViewController" bundle:nil];
    vc.title = @"View with UITextField";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)tappedTextViewButton:(id)sender
{
    TAPTextViewViewController *vc = [[TAPTextViewViewController alloc] initWithNibName:@"TAPTextViewViewController" bundle:nil];
    vc.title = @"View with UITextView";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
