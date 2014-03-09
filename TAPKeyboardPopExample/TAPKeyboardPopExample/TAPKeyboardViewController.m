#import "TAPKeyboardViewController.h"
#import "UIViewController+TAPKeyboardPop.h"

@interface TAPKeyboardViewController () <UITextViewDelegate>

@property(nonatomic, retain) IBOutlet UITextField *textField;

@end

@implementation TAPKeyboardViewController

- (IBAction)endEditing:(id)sender
{
    [self.view endEditing:YES];
}

@end
