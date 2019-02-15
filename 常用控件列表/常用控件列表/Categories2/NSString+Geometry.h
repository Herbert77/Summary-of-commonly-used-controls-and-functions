//
//  NSString+Geometry.h
//  SmartCity
//
//  Created by ZCGC on 2017/5/19.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Geometry)

/**
 获取字符串的 size

 @param width 给定字符串的最大宽度
 @return 字符串的size
 */
- (CGSize)textSizeForMaxWidth:(CGFloat)width;
/**
 获取字符串的 size

 @param font 给点字体大小
 @param width 最大宽度
 @return 字符串size
 */
- (CGSize)textSizeFor:(UIFont *)font maxWidth:(CGFloat)width;
/**
 或者字符串的宽度

 @param font 字体大小
 @return 字符串 宽度
 */
- (CGFloat)textWidthWithForFont:(UIFont *)font;

@end
