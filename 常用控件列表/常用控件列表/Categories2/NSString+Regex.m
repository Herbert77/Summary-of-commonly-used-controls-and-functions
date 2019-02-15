//
//  NSString+Regex.m
//  ZXHT
//
//  Created by peng on 2017/4/10.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import "NSString+Regex.h"

@implementation NSString (Regex)

- (BOOL)validateNumber {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < self.length) {
        NSString * string = [self substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

- (BOOL)isMobileNumber {
//    NSString *MOBILE = @"[1][345678]\\d{9}";
    NSString *MOBILE = @"[1]\\d{10}";
    
    return [self isValidateByRegex:MOBILE];
}

- (BOOL)isIdCardNumber {
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)|([0-9]{17}([0-9]|x)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

+ (instancetype)secretTelOfOrignalTel:(NSString *)orignalTel {
    if ([orignalTel isMobileNumber]) {
        return [orignalTel stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }
    return @"";
    
}

- (BOOL)isValidateByRegex:(NSString *)regex
{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT];
}

- (BOOL)replaceEmojiByNilString
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\\r\\n\\u2026]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:self
                                                               options:0
                                                                 range:NSMakeRange(0, [self length])
                                                          withTemplate:@""];
    if (modifiedString.length == 0) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  URLDecode
 */
+ (NSString *)URLDecodedString:(NSString *)decodedStr
{
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    
    NSString *encodedString = decodedStr;
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)encodedString,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

/**
 *  URLEncode
 */
+ (NSString *)URLEncodedString:(NSString *)encodedStr
{
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *unencodedString = encodedStr;
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

+ (BOOL)containsSpecialCharacter:(NSString *)str {
    NSString * regex = @"[-()（）—”“$&@%^*?+?=|{}?【】？??￥!！.<>/'\":;：；、,，。]";
    NSPredicate * isSpecialCharacter =  [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL bo = NO;
    for (NSInteger i = 0; i < str.length; i++) {
        NSString *temp = [str substringWithRange:NSMakeRange(i, 1)];
        bo = [isSpecialCharacter evaluateWithObject:temp];
        if (bo) return bo;
    }
    return bo;
}

@end
