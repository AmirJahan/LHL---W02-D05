#import "ViewController.h"


// private
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@property (weak, nonatomic) IBOutlet UIButton *mySecondSendButton;

@end



@implementation ViewController
UIButton* myThirdButton;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [_mySecondSendButton addTarget:self
                            action:@selector(sendTwoAction:)
                  forControlEvents:UIControlEventTouchUpInside];


    //
    
    CGRect buttonFrame = CGRectMake(10, 10, 250, 50);
    
    myThirdButton = [[UIButton alloc] initWithFrame:buttonFrame];
    
    myThirdButton.center = self.view.center;
    [myThirdButton setBackgroundColor:[UIColor darkGrayColor]];
    
    [myThirdButton setTitle:@"Do it" forState:UIControlStateNormal];
    
    
    [self.view addSubview: myThirdButton];
    
    
    [myThirdButton addTarget:self
                      action:@selector(thirdAction:) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)thirdAction:(UIButton *)sender
{
    if ( sender == myThirdButton)
    {
            
    }
    
}




-(IBAction)sendAction:(id)sender
{
    
}


-(IBAction)sendTwoAction:(id)sender
{
    if ( sender == _mySecondSendButton)
        NSLog(@"You clicked on the 2nd one");
}


@end
