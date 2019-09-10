//
//  NSString+TrimmingCharacters.m
//  MV510
//
//  Created by Herbert Hu on 2019/8/29.
//  Copyright © 2019年 tecom. All rights reserved.
//

#import "NSString+TrimmingCharacters.h"

@implementation NSString (TrimmingCharacters)

- (NSString *)trimingWhitespaceAndNewlineCharacter {

    NSString *str = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return str;
}

@end
