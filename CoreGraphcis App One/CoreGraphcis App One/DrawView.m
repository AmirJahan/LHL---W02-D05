
#import "DrawView.h"


@implementation DrawView

- (id)initWithFrame:(CGRect)frame 
{
	if (self = [super initWithFrame:frame]) {
	}
	return self;
}


- (void)drawRect:(CGRect)rect
{
    // Get context first (Quartz 2D drawing destination)
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw blue rectangle
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextFillRect(context, CGRectMake(100, 100, 100, 50));
    
    // Draw orange oval
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(200, 200, 100, 50));
    
    // Draw a line, 5.0px wide
    CGContextSetLineWidth(context, 5.0);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGPoint points[] = {
        CGPointMake(50, 50),
        CGPointMake(10, 200)
    };
    CGContextAddLines(context, points, 2);
    CGContextStrokeLineSegments(context, points, 2);
}




@end
