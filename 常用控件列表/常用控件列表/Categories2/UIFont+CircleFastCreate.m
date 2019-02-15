//
//  UIFont+CircleFastCreate.m
//  SmartCity
//
//  Created by ZCGC on 2017/5/19.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import "UIFont+CircleFastCreate.h"

@implementation UIFont (CircleFastCreate)

+ (instancetype)regularPingFangOfSize:(CGFloat)size {
    UIFont *font = [self fontWithName:@"PingFangSC-Regular" size:size];
    return font ?: [UIFont systemFontOfSize:size];
}
+ (instancetype)mediumPingFangOfSize:(CGFloat)size {
    UIFont *font = [self fontWithName:@"PingFangSC-Medium" size:size];
    return font ?: [UIFont systemFontOfSize:size];
}
+ (instancetype)boldPingFangOfSize:(CGFloat)size {
    UIFont *font = [self fontWithName:@"PingFangSC-Semibold" size:size];
    return font ?: [UIFont systemFontOfSize:size];
}

@end
