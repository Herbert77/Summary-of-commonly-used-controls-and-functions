//
//  NSString+JsonExtension.h
//  ZXHT
//
//  Created by peng on 2018/1/25.
//  Copyright © 2018年 zxht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JsonExtension)

/**
 json格式字符串转字典
 */
- (NSDictionary *)jsonStringToDictionary;

/**
 产生指定长度的随机字符串
 
 @param length 随机字符串的长度
 */
+ (NSString *)randomStringWithLength:(int)length;

- (NSString *)stringByDeletingPictureResolution;


/**
 格式化日期字符串
 转成成   2018-10-10 09:00:00 -> 今天 09:00
 
 @return
 */
- (NSString *)dateStringWithFormat:(NSString *)str;
@end
