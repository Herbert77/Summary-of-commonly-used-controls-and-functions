//
//  NSArray+SetForContent.m
//  ZXHT
//
//  Created by LSP on 2018/11/26.
//  Copyright © 2018 zxht. All rights reserved.
//

#import "NSArray+SetForContent.h"

@implementation NSArray (SetForContent)

- (NSArray *)arrayFromObjectsForKey:(NSString *)key {
    
    NSMutableArray *marr = [NSMutableArray arrayWithCapacity:self.count];
    for (NSObject *element in self) {
        NSObject *value = [element valueForKey:key];
        if (value && ![marr containsObject:value]) {
            [marr addObject:value];
        }
    }
    return marr;
}

@end
