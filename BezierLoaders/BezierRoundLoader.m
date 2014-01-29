//
//  BezierRoundLoader.m
//  BezierLoaders
//
//  Created by Mahesh on 12/28/13.
//  Copyright (c) 2013 Mahesh. All rights reserved.
//

#import "BezierRoundLoader.h"

@interface BezierRoundLoader()
{
    NSMutableArray *paths;
    UIBezierPath *path;
    CAShapeLayer *shapeLayer;
}

@end

@implementation BezierRoundLoader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = frame;
        [self.layer addSublayer:shapeLayer];
        paths = [NSMutableArray arrayWithCapacity:2 * 60];
        
        [self updatePaths];
    }
    return self;
}

- (void)updatePaths
{
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    path = [UIBezierPath bezierPath]; //empty path
    [path setLineWidth:2];
    [path moveToPoint:center];
    CGPoint next;
    next.x = center.x + self.bounds.size.width/2 * cos(0);
    next.y = center.y + self.bounds.size.width/2 * sin(0);
    [path addLineToPoint:next]; //go one end of arc
    
    [path addArcWithCenter:center radius:self.bounds.size.width/2 startAngle:0 endAngle:M_PI/4 clockwise:YES]; //add the arc
    [path addLineToPoint:center]; //back to center
    
    //[[UIColor greenColor] set];
    //[path fill];
    //[[UIColor redColor] set];
    //[path stroke];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor greenColor].CGColor;
    
    [paths addObjectsFromArray:[BezierRoundLoader keyframePathsWithDuration:2 sourceStartAngle:0 sourceEndAngle:0 destinationStartAngle:0 destinationEndAngle:2 * M_PI centerPoint:self.center size:CGSizeMake(self.bounds.size.width, self.bounds.size.width) sourceRadiusPercent:0.5 destinationRadiusPercent:0.5]];
    
    shapeLayer.path = (__bridge CGPathRef)((id)paths[(paths.count -1)]);
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    [pathAnimation setValues:paths];
    [pathAnimation setDuration:2];
    [pathAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [pathAnimation setRemovedOnCompletion:YES];
    [shapeLayer addAnimation:pathAnimation forKey:@"path"];

    
    
}

+ (NSArray *)keyframePathsWithDuration:(CGFloat) duration sourceStartAngle:(CGFloat)sourceStartAngle sourceEndAngle:(CGFloat)sourceEndAngle destinationStartAngle:(CGFloat)destinationStartAngle destinationEndAngle:(CGFloat)destinationEndAngle centerPoint:(CGPoint)centerPoint size:(CGSize)size sourceRadiusPercent:(CGFloat)sourceRadiusPercent destinationRadiusPercent:(CGFloat)destinationRadiusPercent
{
    NSUInteger frameCount = ceil(duration * 60);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:frameCount + 1];
    for (int frame = 0; frame <= frameCount; frame++)
    {
        CGFloat startAngle = sourceStartAngle + (((destinationStartAngle - sourceStartAngle) * frame) / frameCount);
        CGFloat endAngle = sourceEndAngle + (((destinationEndAngle - sourceEndAngle) * frame) / frameCount);
        CGFloat radiusPercent = sourceRadiusPercent + (((destinationRadiusPercent - sourceRadiusPercent) * frame) / frameCount);
        CGFloat radius = MIN(size.width, size.height) * radiusPercent;
        
        [array addObject:(id)([BezierRoundLoader slicePathWithStartAngle:startAngle endAngle:endAngle centerPoint:centerPoint radius:radius].CGPath)];
    }
    
    return [NSArray arrayWithArray:array];
}

+ (UIBezierPath *)slicePathWithStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle centerPoint:(CGPoint)centerPoint radius:(CGFloat)radius
{
    BOOL clockwise = startAngle < endAngle;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:centerPoint];
    [path addArcWithCenter:centerPoint radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
    [path closePath];
    
    return path;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    /*CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    UIBezierPath *arc = [UIBezierPath bezierPath]; //empty path
    [arc setLineWidth:2];
    [arc addArcWithCenter:center radius:self.bounds.size.width/2 startAngle:0 endAngle:2 *M_PI clockwise:YES]; //add the arc
    [[UIColor redColor] set];
    [arc stroke];*/
}


@end
