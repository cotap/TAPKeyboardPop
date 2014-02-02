#import "TAPRootViewController.h"
#import "TAPKeyboardViewController.h"

@interface TAPRootViewController ()

@end

@implementation TAPRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma - IBActions

- (IBAction)tappedMoveForwardButton:(id)sender
{
    TAPKeyboardViewController *keyboardViewController = [[TAPKeyboardViewController alloc] initWithNibName:@"TAPKeyboardViewController" bundle:nil];
    keyboardViewController.title = @"View with keyboard";
    [self.navigationController pushViewController:keyboardViewController animated:YES];
}

@end
