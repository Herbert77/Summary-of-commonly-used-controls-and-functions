//
//  NSString+ShopPriceAppearance.h
//  SmartCity
//
//  Created by BattleMage on 2018/11/22.
//  Copyright © 2018年 NRH. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ShopPriceAppearance)
/**云店价格/金额 显示自定义样式
 * 去除小数点后面多余的0
 * 钱币符号￥和小数点后面的金额字号比金额整数部分小
 * 超过万元显示样式  13821 显示 1.38万
 */

/**
 自定义Font
 @param stringFloat 价格浮点型字符串（不带￥且最多保留两位小数）
 @param maxFont 样式中部大号字体
 @param minFont ￥和小数点之后的小号字体
 @return 返回处理后样式的字符串
 */
+ (NSMutableAttributedString *)shopPriceAppearance:(NSString *)stringFloat maxFont:(UIFont *)maxFont minFont:(UIFont *)minFont;

/**
 默认Font：regularPingFangOfSize
 @param stringFloat 价格浮点型字符串（不带￥且最多保留两位小数）
 @param maxSize   样式中部大号字体
 @param minSize   ￥和小数点之后的小号字体
 @return 返回处理后样式的字符串
 */
+ (NSMutableAttributedString *)shopPriceAppearance:(NSString *)stringFloat maxSize:(CGFloat)maxSize minSize:(CGFloat )minSize;

/**
 去掉金额小数点后面的字符串
 
 @param stringFloat 浮点型金额字符串
 @return 去掉小数点后多余0的字符串
 */
+ (NSString *)priceRemoveExtraZeros:(NSString *)stringFloat;

@end

NS_ASSUME_NONNULL_END
