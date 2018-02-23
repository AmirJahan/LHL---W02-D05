#import "ViewController.h"
#import <WebKit/WebKit.h>
// **


@interface ViewController () <WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet WKWebView *myWkWebView;

@property (nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [_myWkWebView addObserver:self
                   forKeyPath:@"loading"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    
    _activityIndicator.hidesWhenStopped = true;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSURL *url = [NSURL URLWithString:@"https://stackoverflow.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_myWkWebView loadRequest:request];
}

- (void)dealloc
{
    [_myWkWebView removeObserver:self
                    forKeyPath:@"loading"];
}

// Example of KVO (Key Value Observing)
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"loading"])
    {
        NSLog(@"%@", change);
        if ([change[@"new"] isEqualToNumber:@1])
        {
            [self.activityIndicator startAnimating];
        }
        else
        {
            [self.activityIndicator stopAnimating];
        }
    }
}

@end
