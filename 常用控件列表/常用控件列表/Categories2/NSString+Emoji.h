//
//  NSString+Emoji.h
//  ZxCityStore
//
//  Created by apple on 2017/9/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Emoji)
/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithIntCode:(int)intCode;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithStringCode:(NSString *)stringCode;
- (NSString *)emoji;

/**
 *  是否为emoji字符
 */
- (BOOL)isEmoji;


- (BOOL)isEmojiUnicode;

/**
 判断字符串中是否包含有emoji标签
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;



/**
 *  判断字符串中是否存在emoji
 * @return YES(含有表情)
 */
- (BOOL)stringContainsEmoji;

/**
 移除emoji表情
 */
- (instancetype)removedEmojiString;


/**
 *  判断字符串中是否存在emoji(第三方输入法)
 * @return YES(含有表情)
 */
- (BOOL)hasEmoji;

/**
 过滤表情
 */
- (NSString *)disable_emoji;

/**
 判断是不是九宫格
 @return YES(是九宫格拼音键盘)
 */
- (BOOL)isNineKeyBoard;

// 使用方式
//// 判断键盘是不是九宫格键盘
//if ([string isNineKeyBoard] ){
//    return YES;
//}else{
//    if ([string hasEmoji] || [string stringContainsEmoji]){
//        return NO;
//    }
//}

@end
