#import "TAPTextFieldViewController.h"
#import "UIViewController+TAPKeyboardPop.h"

@interface TAPTextFieldViewController () <UITextViewDelegate>

@property(nonatomic, retain) IBOutlet UITextField *textField;

@end

@implementation TAPTextFieldViewController

- (IBAction)endEditing:(id)sender
{
    [self.view endEditing:YES];
}

@end
