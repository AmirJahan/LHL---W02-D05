@import UIKit;

@interface LineSegmentDataModel : NSObject

@property (nonatomic, readonly) CGPoint firstPoint;
@property (nonatomic, readonly) CGPoint secondPoint;


// When you use 'id', you get essentially no type checking at all. With instancetype, the compiler and IDE know what type of thing is being returned, and can check your code better and autocomplete better.
- (instancetype)initWithFirstPoint:(CGPoint)first
                       secondPoint:(CGPoint)second;
@end


// 50,50 - 100,100
// 100,100 - 200,200
// 300,300 - 400,400
