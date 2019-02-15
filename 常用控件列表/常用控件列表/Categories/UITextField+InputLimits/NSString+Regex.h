//
//  NSString+Regex.h
//  ZXHT
//
//  Created by peng on 2017/4/10.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)

/**
 是否是纯整数
 */
- (BOOL)validateNumber;

/**
 是否是手机号
 */
- (BOOL)isMobileNumber;

/**
 是否身份证号码
 */
- (BOOL)isIdCardNumber;

/**
 私密手机号
 */
+ (instancetype)secretTelOfOrignalTel:(NSString *)orignalTel;

/**
 根据字符串字体最大宽度 获取字符串的size
 
 @param font 字体大小
 @param maxW 字符串最大宽度
 @return 字符串的size
 */
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

/**
 获取字符串的size
 
 @param font 字体大小
 @return 字符串size
 */
- (CGSize)sizeWithFont:(UIFont *)font;

/**
 *  URLDecode
 */
+ (NSString *)URLDecodedString:(NSString *)decodedStr;
/**
 *  URLEncode
 */
+ (NSString *)URLEncodedString:(NSString *)encodedStr;

/**
 判断是否含有特殊字符
 */
+ (BOOL)containsSpecialCharacter:(NSString *)str;
@end
