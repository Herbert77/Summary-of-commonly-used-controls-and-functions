//
//  UIView+Shadow.h
//  ZXHT
//
//  Created by Cz on 2018/6/6.
//  Copyright © 2018年 zxht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shadow)

+ (void)addShadowToView:(UIView *)view
            withOpacity:(float)shadowOpacity
           shadowRadius:(CGFloat)shadowRadius
        andCornerRadius:(CGFloat)cornerRadius;


+ (void)addShadowToView:(UIView *)view
        withShadowColor:(UIColor *)color shadowOffset:(CGSize)size opacity:(float)shadowOpacity
           shadowRadius:(CGFloat)shadowRadius
        andCornerRadius:(CGFloat)cornerRadius;

@end
