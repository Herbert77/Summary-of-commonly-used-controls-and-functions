//
//  Person+Cate.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/27.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "Person+Cate.h"
#import <objc/runtime.h>

static NSString *const addressKey = @"addressKey";

@implementation Person (Cate)

- (NSString *)address {
    return objc_getAssociatedObject(self, &addressKey);
}

- (void)setAddress:(NSString *)address {
    objc_setAssociatedObject(self, &addressKey, address, OBJC_ASSOCIATION_COPY);
}

@end

