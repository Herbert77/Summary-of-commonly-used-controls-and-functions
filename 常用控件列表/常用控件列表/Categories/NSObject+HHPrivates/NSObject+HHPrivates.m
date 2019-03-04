//
//  NSObject+HHPrivates.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/2.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "NSObject+HHPrivates.h"

@implementation NSObject (HHPrivates)

- (void)p_setShadowForViews:(nonnull NSArray <UIView *>*)viewsArr
               shadowOffset:(CGSize)shadowOffset
               shadowRadius:(CGFloat)shadowRadius
              shadowOpacity:(CGFloat)shadowOpacity
                shadowColor:(nullable UIColor *)shadowColor
               cornerRadius:(CGFloat)cornerRadius
                borderWidth:(CGFloat)borderWidth
                borderColor:(nullable UIColor *)borderColor {
    
    for (UIView *view in viewsArr) {
        [[view layer] setShadowOffset:shadowOffset];
        [[view layer] setShadowRadius:shadowRadius];
        [[view layer] setShadowOpacity:shadowOpacity];
        [[view layer] setShadowColor:shadowColor ? [shadowColor CGColor]:[[UIColor blackColor] CGColor]];
        
        [[view layer] setMasksToBounds:NO];
        [[view layer] setCornerRadius:cornerRadius];
        [[view layer] setBorderWidth:borderWidth];
        [[view layer] setBorderColor:borderColor ? [borderColor CGColor]:[UIColor clearColor].CGColor];
    }
}

- (void)p_setBorderForButtons:(nonnull NSArray <UIButton *>*)btnsArr
                  borderWidth:(NSInteger)borderWidth
                  borderColor:(UIColor *)borderColor
                 cornerRadius:(NSInteger)radius {
    
    for (UIButton *btn in btnsArr) {
        [[btn layer] setMasksToBounds:NO];
        [[btn layer] setCornerRadius:radius];
        [[btn layer] setBorderColor:borderColor.CGColor];
        [[btn layer] setBorderWidth:borderWidth];
    }
}

- (void)p_makeTheViews:(nullable NSArray <UIView *>*)viewsArr
               visible:(BOOL)isVisible
         andOtherViews:(nullable NSArray <UIView *>*)otherViewsArr
               visible:(BOOL)otherIsVisible{
    
    for (UIView *view in viewsArr) {
        [view setHidden:!isVisible];
    }
    for (UIView *view in otherViewsArr) {
        [view setHidden:!otherIsVisible];
    }
}

@end
