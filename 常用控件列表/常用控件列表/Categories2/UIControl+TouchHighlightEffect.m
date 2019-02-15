//
//  UIControl+TouchHighlightEffect.m
//  SmartCity
//
//  Created by ZCGC on 2017/5/25.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import "UIControl+TouchHighlightEffect.h"
#import <objc/runtime.h>

@implementation UIControl (TouchHighlightEffect)

- (void)_addHighlightEffectOnTouch {
    if (!self.unHighlightedBackgroundColor) {
        self.unHighlightedBackgroundColor = self.backgroundColor;
    }
    
    [self addTarget:self
             action:@selector(touchNeedsHighlighted)
   forControlEvents:(UIControlEventTouchDown |
                     UIControlEventTouchDragEnter)];
    
    [self addTarget:self
             action:@selector(touchNeedsCancelHighlighted)
   forControlEvents:(UIControlEventTouchCancel |
                     UIControlEventTouchDragExit |
                     UIControlEventTouchUpInside)];
}

- (void)_removeHighlightEffectOnTouch {
    [self removeTarget:self
             action:@selector(touchNeedsHighlighted)
   forControlEvents:(UIControlEventAllEvents)];
    
    [self removeTarget:self
             action:@selector(touchNeedsCancelHighlighted)
   forControlEvents:(UIControlEventAllEvents)];
}



- (void)touchNeedsHighlighted {
    
    [UIView animateWithDuration:.15 delay:0
                        options:UIViewAnimationOptionCurveEaseIn |
                                UIViewAnimationOptionLayoutSubviews |
                                UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.backgroundColor = self.highlightedBackgroundColor;
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (void)touchNeedsCancelHighlighted {
    
    [UIView animateWithDuration:.15 delay:0
                        options:UIViewAnimationOptionCurveEaseOut |
                                UIViewAnimationOptionLayoutSubviews |
                                UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.backgroundColor = self.unHighlightedBackgroundColor;
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (void)touchNeedsAnimation {
    self.backgroundColor = self.highlightedBackgroundColor;
    
    [UIView animateWithDuration:.15 delay:0 options:7 animations:^{
        self.backgroundColor = self.unHighlightedBackgroundColor;
    } completion:^(BOOL finished) {
        
    }];
}



- (UIColor *)highlightedBackgroundColor {
    UIColor *color = objc_getAssociatedObject(self, "highlightedBackgroundColor");
    if (!color) {
        self.highlightedBackgroundColor =
        color = [UIColor colorWithWhite:.8 alpha:.5];
    }
    return color;
}

- (void)setHighlightedBackgroundColor:(UIColor *)highlightedBackgroundColor {
    objc_setAssociatedObject(self, "highlightedBackgroundColor", highlightedBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)unHighlightedBackgroundColor {
    UIColor *color = objc_getAssociatedObject(self, "unHighlightedBackgroundColor");
//    if (!color) {
//        self.unHighlightedBackgroundColor =
//        color = [UIColor whiteColor];
//    }
    return color;
}

- (void)setUnHighlightedBackgroundColor:(UIColor *)unHighlightedBackgroundColor {
    objc_setAssociatedObject(self, "unHighlightedBackgroundColor", unHighlightedBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)touchHighlightAble {
    return [objc_getAssociatedObject(self, "touchHighlightAble") boolValue];
}

- (void)setTouchHighlightAble:(BOOL)touchHighlightAble {
    if (touchHighlightAble == self.touchHighlightAble) 
        return;
    
    objc_setAssociatedObject(self, "touchHighlightAble", touchHighlightAble ? @YES : @NO, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (touchHighlightAble) {
        [self _addHighlightEffectOnTouch];
    }else{
        [self _removeHighlightEffectOnTouch];
    }
}

@end

