//
//  NSString+SPExtension.m
//  ZXHT
//
//  Created by LSP on 2018/12/1.
//  Copyright © 2018 zxht. All rights reserved.
//

#import "NSString+SPExtension.h"

@implementation NSString (SPExtension)

- (NSString *)firstCharacter {
    if (self.length) {
        return [self substringToIndex:1];
    }
    return @"";
}

@end
