//
//  NSString+DecimalNumber.m
//  NumberTool
//
//  Created by apple on 2017/3/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NSString+DecimalNumber.h"
typedef enum {
    DealTypeAdd,
    DealTypeSub,
    DealTypeMul,
    DealTypeDiv
}DealType;

@implementation NSString (DecimalNumber)



- (NSString *)addNumberString:(NSString *)numberStr{
    
    return [self dealNumberString:numberStr type:DealTypeAdd];
}

- (NSString *)subNumberString:(NSString *)numberStr{
    return [self dealNumberString:numberStr type:DealTypeSub];
}

- (NSString *)mulNumberString:(NSString *)numberStr{
    return [self dealNumberString:numberStr type:DealTypeMul];
}

- (NSString *)divNumberString:(NSString *)numberStr{
    return [self dealNumberString:numberStr type:DealTypeDiv];
}

- (NSString *)dealNumberString:(NSString *)numberStr type:(DealType)type{
    
    NSDecimalNumber *decimal1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimal2 = [NSDecimalNumber decimalNumberWithString:numberStr];
    NSDecimalNumber *result;
    switch (type) {
        case DealTypeAdd:
            result = [decimal1 decimalNumberByAdding:decimal2];
            break;
        case DealTypeSub:
            result = [decimal1 decimalNumberBySubtracting:decimal2];
            break;
        case DealTypeMul:
            result = [decimal1 decimalNumberByMultiplyingBy:decimal2];
            break;
        case DealTypeDiv:
            result = [decimal1 decimalNumberByDividingBy:decimal2];
            break;
        default:
            break;
    }
    
    
    
//    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
//    
//    
//    NSDecimalNumber *roundedOunces = [result decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
//    
//    return [NSString stringWithFormat:@"%@",roundedOunces];
    
    
    return result.stringValue;
    
}

- (NSString *)notRoundingAfterPoint:(int)position{
    
    NSDecimalNumber *originalDecimal = [NSDecimalNumber decimalNumberWithString:self];
    // 四舍五入的保留小数点后指定位数加一位的小数
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:(position + 1) raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *roundedOunces = [originalDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    // 不四舍五入的保留小数点后指导位数的小数
    NSDecimalNumberHandler *finalBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *inalOunces = [roundedOunces decimalNumberByRoundingAccordingToBehavior:finalBehavior];
    
    
    NSString* string = [NSString stringWithFormat:@"%@",inalOunces];
    if ([string rangeOfString:@"."].length==0) {
        string = [string stringByAppendingString:@".00"];
    }else{
        NSRange range = [string rangeOfString:@"."];
        if (string.length-range.location-1==2) {
            
        }else{
            string = [string stringByAppendingString:@"0"];
        }
    }
    return string;//整数.00格式
    
}

- (NSString *)notRoundingAfterTwoPoint{
    if (!self.length) {
        return @"0.00";
    }
    return [self notRoundingAfterPoint:2];
}


- (NSString *)autoNotRoundingAfterTwoPoint{
    if (!self.length) {
        return @"0";
    }
    NSDecimalNumber *originalDecimal = [NSDecimalNumber decimalNumberWithString:self];
    // 四舍五入的保留小数点后指定位数加一位的小数
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:(2 + 1) raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *roundedOunces = [originalDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    // 不四舍五入的保留小数点后指导位数的小数
    NSDecimalNumberHandler *finalBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *inalOunces = [roundedOunces decimalNumberByRoundingAccordingToBehavior:finalBehavior];
    
    
    NSString* string = [NSString stringWithFormat:@"%@",inalOunces];
    
    return string;
    
}

@end
