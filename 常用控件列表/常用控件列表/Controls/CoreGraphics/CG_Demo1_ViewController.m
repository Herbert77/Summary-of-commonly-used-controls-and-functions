//
//  CG_Demo1_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/8/21.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "CG_Demo1_ViewController.h"
#import "CG_Demo1_View.h"

@interface CG_Demo1_ViewController ()
{
    CADisplayLink *_displayLink;
}
@property (assign, nonatomic) CGFloat waveWidth;
@property (assign, nonatomic) CGFloat maxAmplitude;
@property (assign, nonatomic) CGFloat frequency;
@property (assign, nonatomic) CGFloat phase;
@property (strong, nonatomic) CALayer *waveSinLayer;
@end

@implementation CG_Demo1_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CG_Demo1_View *v = [[CG_Demo1_View alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:v];
    
    // 通过UIBezierPath和CAShapeLayer来创建一个简单的火柴人
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor colorWithRed:147/255.0 green:231/255.0 blue:182/255.0 alpha:1.0].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
}

//- (UIBezierPath *)createSinPath {
//    
//    self.waveWidth = 100;
//    
//    UIBezierPath *wavePath = [UIBezierPath bezierPath];
//    CGFloat endX = 0;
//    for (CGFloat x=0; x<self.waveWidth+1; x++) {
//        endX = x;
//        CGFloat y = self.maxAmplitude * sinf(360.0 / _waveWidth * (x * M_PI/180) * self.frequency + self.phase * M_PI/180) + self.maxAmplitude;
//        
//        if (x == 0) {
//            [wavePath moveToPoint:CGPointMake(x, y)];
//        }
//        else {
//            [wavePath addLineToPoint:CGPointMake(x, y)];
//        }
//    }
//    
//    CGFloat endY = CGRectGetHeight(self.bounds) + 10;
//    [wavePath addLineToPoint:CGPointMake(endX, endY)];
//    [wavePath addLineToPoint:CGPointMake(0, endY)];
//    
//    return wavePath;
//}
//
//- (void)startLoading {
//    
//    [_displayLink invalidate];
//    
//    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWave:)];
//    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
//}
//
//- (void)updateWave:(CADisplayLink *)displayLink {
//    
//    self.phase += 8;
//    self.waveSinLayer.path = [self createSinPath].CGPath;
//}

@end
