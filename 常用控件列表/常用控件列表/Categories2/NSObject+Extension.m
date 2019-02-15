//
//  NSObject+Extension.m
//  ZXHT
//
//  Created by peng on 2017/3/30.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

- (void)clearAllPropertyValue
{
    unsigned int outCount = 0;
    Ivar *ivarList = class_copyIvarList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivarList[i];
        const char *name = ivar_getName(ivar);
        NSString *ivarName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        
        if ([[self valueForKey:ivarName] isKindOfClass:[NSNumber class]]) {
            [self setValue:@0 forKey:ivarName];
        } else if ([[self valueForKey:ivarName] isKindOfClass:[NSString class]]) {
            [self setValue:@"" forKey:ivarName];
        } else if ([[self valueForKey:ivarName] isKindOfClass:[NSObject class]]) {
            [self setValue:nil forKey:ivarName];
        } else if ([[self valueForKey:ivarName] isKindOfClass:[NSArray class]]) {
            [self setValue:@[] forKey:ivarName];
        } else if ([[self valueForKey:ivarName] isKindOfClass:[NSDictionary class]]) {
            [self setValue:@{} forKey:ivarName];
        } else {
//            PPLog(@"else 情况 %@ = %@", ivarName, [[self valueForKey:ivarName] class])
//            [self setValue:[NSNull null] forKey:ivarName];
            [self setValue:nil forKey:ivarName];
        }
        
        if ([ivarName isEqualToString:@"_backUser"]) {
            [self setValue:nil forKey:ivarName];
        }
    }
    free(ivarList);
}


@end
