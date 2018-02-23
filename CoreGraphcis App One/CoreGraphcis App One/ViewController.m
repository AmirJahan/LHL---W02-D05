#import "ViewController.h"

#import "DrawView.h"
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DrawView *theView = [[DrawView alloc] initWithFrame:self.view.frame];
    theView.backgroundColor = [UIColor lightGrayColor];
    
    [theView drawRect: self.view.frame];
    
    [self.view addSubview: theView];
     
}




@end
