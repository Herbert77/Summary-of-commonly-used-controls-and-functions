//
//  NSObject+SPValidation.h
//  城市2.0
//
//  Created by MYS on 2017/4/24.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SPValidation)

/**
 是否是合法的字符串

 @return 是否合法
 */
- (BOOL)isValidString;
/**
 是否是合法的 Number

 @return 是否合法
 */
- (BOOL)isValidNumber;
/**
 是否是合法的数组

 @return 是否合法
 */
- (BOOL)isValidArray;
/**
 是否是合法的字典

 @return 是否合法
 */
- (BOOL)isValidDictionary;
/**
 是否是合法的 二进制数据

 @return 是否合法
 */
- (BOOL)isValidData;
@end

@interface NSArray (SPValidation)

/**
 当前数组的索引是否合法

 @param index  当前需查询的索引
 @return 是否合法
 */
- (BOOL)isValidIndex:(NSInteger)index;
@end

@interface NSData (SPValidation)
@end

@interface NSDictionary (SPValidation)
@end

@interface NSNumber (SPValidation)
@end

@interface NSString (SPValidation)
@end
