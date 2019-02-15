//
//  NSString+TransformToPinyin.h
//  ChineseTransform
//
//  Created by huju on 16/7/22.
//  Copyright © 2016年 liuxiaoxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TransformToPinyin)
/**
 *  将汉字转为拼音 （有空格）
 */
- (NSString *)transformToPinyinWithSpace:(BOOL)hasSpace;
/**
 *  得到第一个汉字的的首字母
 */
- (NSString *)getFirstPinYin;

/**
 *  得到各个汉字的首字母
 */
- (NSString *)getAllInitialWithSpace:(BOOL)hasSpace;

- (CGSize)getattributeStringSizeWithAttributes:(NSDictionary *)attributes maxWith:(CGFloat)width;
@end
