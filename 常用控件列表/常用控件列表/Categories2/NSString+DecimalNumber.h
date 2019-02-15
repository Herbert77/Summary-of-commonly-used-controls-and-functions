//
//  NSString+DecimalNumber.h
//  NumberTool
//
//  Created by apple on 2017/3/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSString (DecimalNumber)
/**
 *  精确的加上一个数
 */
- (NSString *)addNumberString:(NSString *)numberStr;
/**
 *  精确的减去一个数
 */
- (NSString *)subNumberString:(NSString *)numberStr;
/**
 *  精确的乘上一个数
 */
- (NSString *)mulNumberString:(NSString *)numberStr;
/**
 *  精确的除以一个数
 */
- (NSString *)divNumberString:(NSString *)numberStr;

/**
 精确的保留小数点后几位
 
 @param position 小数点后保留位数
 */
- (NSString *)notRoundingAfterPoint:(int)position;
/**
 *  精确的保留小数点后两位小数
 */
- (NSString *)notRoundingAfterTwoPoint;
/**
 *  精确的保留小数点后两位小数，如果没有小数，则显示为整数
 */
- (NSString *)autoNotRoundingAfterTwoPoint;

@end
