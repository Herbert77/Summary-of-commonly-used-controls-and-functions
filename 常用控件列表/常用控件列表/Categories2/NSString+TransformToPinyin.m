//
//  NSString+TransformToPinyin.m
//  ChineseTransform
//
//  Created by huju on 16/7/22.
//  Copyright © 2016年 liuxiaoxin. All rights reserved.
//

#import "NSString+TransformToPinyin.h"

@implementation NSString (TransformToPinyin)
- (NSString *)transformToPinyinWithSpace:(BOOL)hasSpace
{
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    NSString *pinyinString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    if (hasSpace) {
        return [pinyinString stringByReplacingOccurrencesOfString:@"'" withString:@""];
    } else {
        NSString *str = [pinyinString stringByReplacingOccurrencesOfString:@"'" withString:@""];
        return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
}


- (NSString *)getFirstPinYin
{
    NSString *pinyin = [self transformToPinyinWithSpace:YES];
    if (pinyin.length > 1) {
       return [pinyin substringToIndex:1];
    }
    return @"";
}


- (NSString *)getAllInitialWithSpace:(BOOL)hasSpace
{
    NSString *pinyin = [self transformToPinyinWithSpace:YES];
    
    NSMutableArray *characterArr = [NSMutableArray array];
    NSArray *pinyins = [pinyin componentsSeparatedByString:@" "];
    [pinyins enumerateObjectsUsingBlock:^(NSString *str, NSUInteger idx, BOOL * _Nonnull stop) {
        if (str.length) {
            str = [str substringToIndex:1];
            [characterArr addObject:str];
        }
        
    }];
    if (hasSpace) {
        return [characterArr componentsJoinedByString:@" "];
    } else {
        NSString *str = [characterArr componentsJoinedByString:@" "];
        return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
}
- (CGSize)getattributeStringSizeWithAttributes:(NSDictionary *)attributes maxWith:(CGFloat)width {
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    return rect.size;
}
@end
