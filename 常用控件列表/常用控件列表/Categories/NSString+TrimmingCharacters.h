//
//  NSString+TrimmingCharacters.h
//  MV510
//
//  Created by Herbert Hu on 2019/8/29.
//  Copyright © 2019年 tecom. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TrimmingCharacters)

/**
 修剪掉字符串中的首尾空格和换行符
 */
- (NSString *)trimingWhitespaceAndNewlineCharacter;

@end

NS_ASSUME_NONNULL_END
