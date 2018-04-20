#import "DrawView.h"
#import "LineSegmentDataModel.h"

@interface DrawView()
// An array of line segmentsfor the path of the user has traced

@property (nonatomic) NSMutableArray <LineSegmentDataModel *> *linesArr;
@end



@implementation DrawView

// Initializer for when created from NIB file
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        _linesArr = [NSMutableArray new];
    }
    return self;
}


#pragma mark - Touch Handling

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    CGPoint first = [touches.anyObject locationInView:self];
    // First line segment is from the initial touch point to the initial touch point
    // basically a point

    LineSegmentDataModel *segment = [[LineSegmentDataModel alloc] initWithFirstPoint:first
                                                                         secondPoint:first];
    [self.linesArr addObject:segment];
    
    // will call drawRect before the end of the current event loop
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint curPoint = [touch locationInView:self];
    CGPoint prevPoint = [touch previousLocationInView:self];
    
    
    // Line segment is from previous touch location to current touch location
    LineSegmentDataModel *segment = [[LineSegmentDataModel alloc] initWithFirstPoint:prevPoint
                                                                         secondPoint:curPoint];
    [self.linesArr addObject:segment];

    // Tell the system that we need to be redrawn, so the system will call drawRect: before
    // the end of the current event loop
    [self setNeedsDisplay];
    
    for ( LineSegmentDataModel* any in self.linesArr)
    {
     
        NSLog(@"This segment first point is: %@", NSStringFromCGPoint( any.firstPoint));
        NSLog(@"This segment second point is: %@", NSStringFromCGPoint( any.secondPoint));
    }
}

#pragma mark - Drawing

// Called whenever a portion of this view needs to be redrawn
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    [[UIColor grayColor] setStroke];

    // Loop through all elements in the segment array and draw each line
    for (LineSegmentDataModel *segment in self.linesArr)
    {
        if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint))
        {
            // If start / end point of line segment is the same (i.e. this is the first
            // point, then move to that point so that line is drawn starting from that
            // point
            [path moveToPoint:segment.firstPoint];
            continue;
        }
        // Draw a line from the previous line segment to the first point
//        [path addLineToPoint: segment.firstPoint];
        // Draw a line from the first point to the second point
        [path addLineToPoint: segment.secondPoint];
    }
    [path stroke];
}


@end
