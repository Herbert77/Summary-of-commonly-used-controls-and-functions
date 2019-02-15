//
//  UIView+XIBCreation.m
//  SmartCity
//
//  Created by ZCGC on 2017/5/12.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import "UIView+XIBCreation.h"

@implementation UIView (XIBCreation)

+ (instancetype)loadFromNib {
    NSArray* array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    for (id obj in array) {
        if ([obj isKindOfClass:[self class]]) {
            return obj;
        }
    }
    return nil;
}

@end
