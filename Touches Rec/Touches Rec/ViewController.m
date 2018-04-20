
#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* mytouch = [[touches allObjects] objectAtIndex: 0];
    
    if ( [touches allObjects].count == 1)
    {
        // Rotate
    }
    else if ([touches allObjects].count == 2)
    {
        // Pinch and scale
    }
        
    
    
    CGPoint loc = [mytouch locationInView: self.view];
    CGPoint prevLoc = [mytouch previousLocationInView:self.view];
    
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}








@end
