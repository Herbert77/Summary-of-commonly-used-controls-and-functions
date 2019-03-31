//
//  HHCat.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/26.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "HHCat.h"
#import <objc/runtime.h>
#import "HHDog.h"

@implementation HHCat

void instanceMethod(id self, SEL _cmd) {
    NSLog(@"This method (instanceMethod) is excuted in HHCat.");
}

// 防线一：动态补加方法
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(instanceMethod)) {
//        class_addMethod(self, sel, (IMP)instanceMethod, "v@:");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}

// 防线二：将消息转发给另一个对象去处理
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(instanceMethod)) {
//        return [HHDog new];
//    }
//    return nil;
//}

// 防线三：手动生成方法签名并实现 forwardInvocation 方法将消息转发给另一个对象。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    /**< 为指定的方法手动生成签名 */
    NSString *selName = NSStringFromSelector(aSelector);
    if ([selName isEqualToString:@"instanceMethod"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    /**< 如果另一个对象可以响应该消息，那么将消息转发给它 */
    SEL sel = [anInvocation selector];
    HHDog *dog = [HHDog new];
    if ([dog respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:dog];
    }
}

@end
