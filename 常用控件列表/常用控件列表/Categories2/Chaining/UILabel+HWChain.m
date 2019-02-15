//
//  UILabel+HWChain.m
//  HomeWork
//
//  Created by apple on 2017/11/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UILabel+HWChain.h"

@implementation UILabel (HWChain)

- (UILabel *(^)(UIColor *color))chainColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(NSString *text))chainText{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(UIFont *font))chainFont{
    
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(NSInteger lines))chainLines{
    return ^(NSInteger lines){
        self.numberOfLines = lines;
        return self;
    };
}
- (UILabel *(^)(NSTextAlignment alignment))chainAlignment{
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

@end
