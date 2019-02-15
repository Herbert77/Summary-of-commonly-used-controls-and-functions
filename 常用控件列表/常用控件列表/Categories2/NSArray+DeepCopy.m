//
//  NSArray+DeepCopy.m
//  ZXHT
//
//  Created by LSP on 2018/12/31.
//  Copyright © 2018 zxht. All rights reserved.
//

#import "NSArray+DeepCopy.h"

@implementation NSArray (DeepCopy)
- (instancetype)deepCopy {
    NSMutableArray *marray = [NSMutableArray arrayWithCapacity:self.count];
    SEL sel = @selector(deepCopy);
    for (id obj in self) {
        if ([obj respondsToSelector:sel]) {
            [marray addObject:[obj deepCopy]];
        } else {
            [marray addObject:[obj copy]];
        }
    }
    return [NSArray arrayWithArray:marray];
}

- (NSMutableArray *)mutableDeepCopy {
    NSMutableArray *marray = [NSMutableArray arrayWithCapacity:self.count];
    SEL sel1 = @selector(deepCopy);
    SEL sel2 = @selector(mutableDeepCopy);
    for (id obj in self) {
        if ([obj respondsToSelector:sel2]) {
            [marray addObject:[obj mutableDeepCopy]];
        } else if ([obj respondsToSelector:sel1]) {
            [marray addObject:[obj deepCopy]];
        } else {
            [marray addObject:[obj copy]];
        }
    }
    return marray;
}

@end

