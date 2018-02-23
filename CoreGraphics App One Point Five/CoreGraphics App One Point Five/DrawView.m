#import "DrawView.h"

@implementation DrawView


- (void)drawRect:(CGRect)rect
{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    [[UIColor redColor] setStroke];
    
    
    [path moveToPoint: CGPointMake(20, 20)];
    [path addLineToPoint: CGPointMake(40, 440)];
    [path addLineToPoint: CGPointMake(220, 220)];
    [path addLineToPoint: CGPointMake(300, 50)];
    
    [path stroke];
    

}


@end
