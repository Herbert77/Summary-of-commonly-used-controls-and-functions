//
//  CG_Demo1_View.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/8/21.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "CG_Demo1_View.h"
#import "CG_Demo1_Layer.h"

@implementation CG_Demo1_View

//+ (Class)layerClass {
//    return [CG_Demo1_Layer class];
//}

- (void)drawRect:(CGRect)rect {
    
    // UIKit way
    /*
    UIBezierPath *bp = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    [[UIColor purpleColor] setFill];
    [bp fill];
    */
    
    // CoreGraphics way
    CGContextRef cRef = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(cRef, CGRectMake(0, 0, 100, 100));
    CGContextSetFillColorWithColor(cRef, [UIColor blueColor].CGColor);
    CGContextFillPath(cRef);
}

@end
