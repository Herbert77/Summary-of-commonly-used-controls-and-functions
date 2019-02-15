//
//  NSString+ShopPriceAppearance.m
//  SmartCity
//
//  Created by BattleMage on 2018/11/22.
//  Copyright © 2018年 NRH. All rights reserved.
//

#import "NSString+ShopPriceAppearance.h"
#import "UIFont+HXExtension.h"

@implementation NSString (ShopPriceAppearance)

/**
 云店价格/金额 显示样式
 自定义Font
 @param stringFloat 价格浮点型字符串（不带￥且最多保留两位小数）
 @param maxFont 样式中部大号字体
 @param minFont ￥和小数点之后的小号字体
 @return 返回处理后样式的字符串
 */
+ (NSMutableAttributedString *)shopPriceAppearance:(NSString *)stringFloat maxFont:(UIFont *)maxFont minFont:(UIFont *)minFont {
    NSString * tempString;
    if (stringFloat.floatValue > 10000) {
        NSString * tempStringFloat = [NSString stringWithFormat:@"%.2f", stringFloat.floatValue / 10000.0];
        tempString = [NSString stringWithFormat:@"￥%@万", [NSString priceRemoveExtraZeros:tempStringFloat]];
    }else {
        NSString * tempStringFloat = stringFloat;
        tempString = [NSString stringWithFormat:@"￥%@", [NSString priceRemoveExtraZeros:tempStringFloat]];
    }
    
    
    CGFloat integerLength;
    CGFloat floatLength;
    if ([tempString containsString:@"."]) {
        NSArray * tempArrs = [tempString componentsSeparatedByString:@"."];
        NSString * frontString = tempArrs.firstObject;
        NSString * behindString = tempArrs.lastObject;
        integerLength = frontString.length - 1;//减去￥的1长度
        floatLength = behindString.length + 1;//加上小数点的1长度
    }else {
        integerLength = tempString.length - 1;
        floatLength = 0;
    }
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc]initWithString:tempString];
    [attrStr addAttributes:@{NSFontAttributeName:minFont} range:NSMakeRange(0, 1)];
    [attrStr addAttributes:@{NSFontAttributeName:maxFont} range:NSMakeRange(1, integerLength)];
    [attrStr addAttributes:@{NSFontAttributeName:minFont} range:NSMakeRange(integerLength + 1, floatLength)];
    return attrStr;
}

/**
 云店价格/金额 显示样式
 默认Font：regularPingFangOfSize
 @param stringFloat 价格浮点型字符串（不带￥且最多保留两位小数）
 @param maxSize   样式中部大号字体
 @param minSize   ￥和小数点之后的小号字体
 @return 返回处理后样式的字符串
 */
+ (NSMutableAttributedString *)shopPriceAppearance:(NSString *)stringFloat maxSize:(CGFloat)maxSize minSize:(CGFloat )minSize {
    NSString * tempString;
    
    stringFloat = [NSString stringWithFormat:@"%.2f", stringFloat.doubleValue];
    
    if (stringFloat.floatValue > 10000) {
        NSString * tempStringFloat = [NSString stringWithFormat:@"%.2f", stringFloat.floatValue / 10000.0];
        tempString = [NSString stringWithFormat:@"￥%@万", [NSString priceRemoveExtraZeros:tempStringFloat]];
    }else {
        NSString * tempStringFloat = stringFloat;
        tempString = [NSString stringWithFormat:@"￥%@", [NSString priceRemoveExtraZeros:tempStringFloat]];
    }
    CGFloat integerLength;
    CGFloat floatLength;
    if ([tempString containsString:@"."]) {
        NSArray * tempArrs = [tempString componentsSeparatedByString:@"."];
        NSString * frontString = tempArrs.firstObject;
        NSString * behindString = tempArrs.lastObject;
        integerLength = frontString.length - 1;//减去￥的1长度
        floatLength = behindString.length + 1;//加上小数点的1长度
    }else {
        integerLength = tempString.length - 1;
        floatLength = 0;
    }
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc]initWithString:tempString];
    [attrStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:minSize weight:UIFontWeightRegular]} range:NSMakeRange(0, 1)];
    [attrStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:maxSize weight:UIFontWeightMedium]} range:NSMakeRange(1, integerLength)];
    [attrStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:minSize weight:UIFontWeightRegular]} range:NSMakeRange(integerLength + 1, floatLength)];
    return attrStr;
}


/**
 移除金额字符串小数点之后多余/无效的 0

 @param stringFloat 金额字符串
 @return 处理之后的字符串
 */
+ (NSString *)priceRemoveExtraZeros:(NSString *)stringFloat {
    NSInteger length = [stringFloat length];
    if ([stringFloat containsString:@"."]) {
        for(NSInteger i = length - 1; i >= 0; i--) {
            NSString *subString = [stringFloat substringFromIndex:i];
            if(![subString isEqualToString:@"0"]) {
                if ([subString isEqualToString:@"."]) {
                    return [stringFloat substringToIndex:[stringFloat length] - 1];
                }else{
                    return stringFloat;
                }
            }else {
                stringFloat = [stringFloat substringToIndex:i];
            }
        }
    }
    return stringFloat;
}

@end
