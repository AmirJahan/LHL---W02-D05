#import "ViewController.h"

@import SafariServices;  // Required for SFSafariViewController

@interface ViewController ()<SFSafariViewControllerDelegate>

@property (strong, nonatomic) UIButton *safariButton;

@end


@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

// SFSafariViewController
// If your app lets users view websites from anywhere on the Internet, use the SFSafariViewController class. If your app customizes, interacts with, or controls the display of web content, use the WKWebView class.

- (IBAction)gotoSafari:(UIButton *)sender
{
    // must add SafariServices for this to work
    NSURL *url = [NSURL URLWithString:@"https://www.google.com"];
    SFSafariViewController *sfVC = [[SFSafariViewController alloc] initWithURL:url];
    [self presentViewController:sfVC
                       animated:YES
                     completion:nil];
}
@end
