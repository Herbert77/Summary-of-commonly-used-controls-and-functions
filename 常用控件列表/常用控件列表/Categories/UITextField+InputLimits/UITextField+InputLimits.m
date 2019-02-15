//
//  UITextField+InputLimits.m
//  textfieldCategory
//
//  Created by Cz on 2018/12/29.
//  Copyright © 2018 Cz. All rights reserved.
//

#import "UITextField+InputLimits.h"
#import <objc/runtime.h>
#import "NSString+Emoji.h"
#import "NSString+Regex.h"

@implementation UITextField (InputLimits)

static NSString *const isPriceInputKey          = @"isPriceInputKey";
static NSString *const isPureNumberKey          = @"isPureNumberKey";
static NSString *const maxpriceLengthKey        = @"maxpriceLengthKey";
static NSString *const isLimitEmojiKey          = @"isLimitEmojiKey";
static NSString *const isLimitSpecialSymbolKey  = @"isLimitSpecialSymbolKey";
static NSString *const maxTextLengthKey         = @"maxTextLengthKey";

- (void)setIsPriceInput:(BOOL)isPriceInput {
    objc_setAssociatedObject(self, &isPriceInputKey, @(isPriceInput), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isPriceInput {
    return [objc_getAssociatedObject(self, &isPriceInputKey) boolValue];
}

- (void)setIsPureNumber:(BOOL)isPureNumber {
    objc_setAssociatedObject(self, &isPureNumberKey, @(isPureNumber), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isPureNumber {
    return [objc_getAssociatedObject(self, &isPureNumberKey) boolValue];
}

- (void)setMaxpriceLength:(NSInteger)maxpriceLength {
    objc_setAssociatedObject(self, &maxpriceLengthKey, @(maxpriceLength), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)maxpriceLength {
    return [objc_getAssociatedObject(self, &maxpriceLengthKey) integerValue];
}

- (void)setIsLimitEmoji:(BOOL)isLimitEmoji {
    objc_setAssociatedObject(self, &isLimitEmojiKey, @(isLimitEmoji), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isLimitEmoji {
    return [objc_getAssociatedObject(self, &isLimitEmojiKey) boolValue];
}

- (void)setIsLimitSpecialSymbol:(BOOL)isLimitSpecialSymbol {
    objc_setAssociatedObject(self, &isLimitSpecialSymbolKey, @(isLimitSpecialSymbol), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isLimitSpecialSymbol {
    return [objc_getAssociatedObject(self, &isLimitSpecialSymbolKey) boolValue];
}

- (void)setMaxTextLength:(NSInteger)maxTextLength {
    objc_setAssociatedObject(self, &maxTextLengthKey, @(maxTextLength), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)maxTextLength {
    return [objc_getAssociatedObject(self, &maxTextLengthKey) integerValue];
}

- (instancetype)init_inputLimits {
    if (self = [super init]) {
        [self addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)textChange:(UITextField *)textField {
    
    // 最大文字长度限制
    [self maxTextLengthLimits:textField];
    
    // 价格输入限制
    [self priceLimits:textField];
    
    // 纯数字输入限制
    [self pureNumberLimits:textField];
    
    // emoji表情输入限制
    [self emojiLimits:textField];
    
    // 特殊字符限制
    [self specialSymbolLimits:textField];
}

- (void)maxTextLengthLimits:(UITextField *)textField {
    NSString *toBeString = textField.text;
    if (toBeString.length && self.maxTextLength) {
        // 获取当前的输入语言
        NSString *currentLang = [[textField textInputMode] primaryLanguage];
        if ([currentLang isEqualToString:@"zh-Hans"]) {
            UITextRange *markedRange = [textField markedTextRange];
            UITextPosition *markedPosition = [textField positionFromPosition:markedRange.start offset:0];
            if (!markedPosition) {
                if (toBeString.length > self.maxTextLength) {
                    textField.text = [toBeString substringToIndex:self.maxTextLength];
                }
            }
        } else {
            if (toBeString.length > self.maxTextLength) {
                textField.text = [toBeString substringToIndex:self.maxTextLength];
            }
        }
    }
}

- (void)priceLimits:(UITextField *)textField {
    // 金额输入限制
    NSString *tobeString = textField.text;
    // 金额正则，maxpriceLength默认9
    NSString *regex = [NSString stringWithFormat:@"(\\+|\\-)?(([0]|(0[.]\\d{0,2}))|([1-9]\\d{0,%zd}(([.]\\d{0,2})?)))?", self.maxpriceLength?:9];
    
    if (self.isPriceInput) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        NSString *currentLang = [[textField textInputMode] primaryLanguage];
        if ([currentLang isEqualToString:@"zh-Hans"]) {
            UITextRange *markedRange = [textField markedTextRange];
            UITextPosition *markedPosition = [textField positionFromPosition:markedRange.start offset:0];
            if (!markedPosition) {
                if (![predicate evaluateWithObject:tobeString]) {
                    [textField deleteBackward];
                }
            }
        } else {
            if (![predicate evaluateWithObject:tobeString]) {
                // 删除最后输入的字符
                textField.text = [tobeString substringToIndex:tobeString.length - 1];
            }
        }
    }
}

- (void)pureNumberLimits:(UITextField *)textField {
    NSString *tobeString = textField.text;
    
    if (self.isPureNumber) {
        if (![tobeString validateNumber]) {
            NSString * regexString = @"[^0123456789]";
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:nil];
            textField.text = [regex stringByReplacingMatchesInString:tobeString options:0 range:NSMakeRange(0, tobeString.length) withTemplate:@""];
        }
        
        NSInteger maxLength = self.maxpriceLength?:9;
        if (textField.text.length > maxLength) {
            textField.text = [textField.text substringToIndex:maxLength];
        }
    }
}

- (void)emojiLimits:(UITextField *)textField {
    NSString *tobeString = textField.text;
    
    if (self.isLimitEmoji) {
        if ([tobeString stringContainsEmoji]) {
            textField.text = [self replaceEmojiByNilString:tobeString];
        }
    }
}

- (void)specialSymbolLimits:(UITextField *)textField {
    if (self.isLimitSpecialSymbol) {
        NSString *tobeString = textField.text;
        
        if ([NSString containsSpecialCharacter:tobeString]) {
            NSString * regexString = @"[-()（）—”“$&@%^*?+?=|{}?【】？??￥!！.<>/'\":;：；、,，。]";
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:nil];
            textField.text = [regex stringByReplacingMatchesInString:tobeString options:0 range:NSMakeRange(0, tobeString.length) withTemplate:@""];
        }
    }
}

- (NSString *)replaceEmojiByNilString:(NSString *)string {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\\r\\n\\u2026]" options:NSRegularExpressionCaseInsensitive error:nil];
    return [regex stringByReplacingMatchesInString:string
                                                               options:0
                                                                 range:NSMakeRange(0, [string length])
                                                          withTemplate:@""];
}

@end
