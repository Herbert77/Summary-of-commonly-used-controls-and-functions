//
//  UIButton+HWChain.m
//  HomeWork
//
//  Created by apple on 2017/11/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UIButton+HWChain.h"

@implementation UIButton (HWChain)

- (UIButton *(^)(NSString *title))chainNormalTitle{
    return ^(NSString *title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIColor *color))chainNormalTitleColor{
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(NSString *imageName))chainNormalImageName{
    return ^(NSString *imageName){
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(NSString *imageName))chainNormalBackgroundIamgeName{
    return ^(NSString *imageName){
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIImage *image))chainNormalImage{
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIImage *image))chainNormalBgroundIamge{
    return ^(UIImage *image){
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIFont *font))chainTitleFont{
    return ^(UIFont *font){
        self.titleLabel.font = font;
        return self;
    };
}

- (UIButton *(^)(id target, NSString *methond, UIControlEvents event))chainEvent{
    
    
    return ^UIButton *(id target, NSString *methond, UIControlEvents event){
        
        [self addTarget:target action:NSSelectorFromString(methond) forControlEvents:event];
        return self;
    };
}

@end
