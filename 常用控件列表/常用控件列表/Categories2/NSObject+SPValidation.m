//
//  NSObject+SPValidation.m
//  城市2.0
//
//  Created by MYS on 2017/4/24.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import "NSObject+SPValidation.h"

@implementation NSObject (SPValidation)
- (BOOL)isValidString {
    return NO;
}

- (BOOL)isValidNumber {
    return NO;
}

- (BOOL)isValidArray {
    return NO;
}

- (BOOL)isValidDictionary {
    return NO;
}

- (BOOL)isValidData {
    return NO;
}

// 避免系统的手写键盘导致的崩溃,但会出现候选列表空白
- (id)candidateList {
    return nil;
}

@end

@implementation NSArray (SPValidation)
- (BOOL)isValidArray {
    return self.count != 0;
}

- (BOOL)isValidIndex:(NSInteger)index {
    return self.count != 0 &&
    index >= 0 &&
    index < self.count;
}
@end

@implementation NSData (SPValidation)
- (BOOL)isValidData {
    return self.length != 0;
}
@end

@implementation NSDictionary (SPValidation)
- (BOOL)isValidDictionary {
    return self.count != 0;
}
@end

@implementation NSNumber (SPValidation)
- (BOOL)isValidNumber {
    return YES;
}
@end

@implementation NSString (SPValidation)
- (BOOL)isValidString {
    return self.length != 0 &&
    ![self isEqualToString:@"null"];
}
@end
