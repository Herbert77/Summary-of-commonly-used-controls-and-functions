//
//  MethodSwizzlingTest.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/27.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "MethodSwizzlingTest.h"
#import <objc/runtime.h>

@implementation MethodSwizzlingTest

// load 方法有且只有一次会被调用
/*
+ (void)load {
    Class class = [self class];
    
    SEL insMethod1_Sel = @selector(instanceMethod1);
    SEL insMethod2_Sel = @selector(instanceMethod2);
    
    SEL classMethod1_Sel = @selector(classMethod1);
    SEL classMethod2_Sel = @selector(classMethod2);
    
    // 根据方法名获取方法对象
    Method insMethod1 = class_getInstanceMethod(class, insMethod1_Sel);
    Method insMethod2 = class_getInstanceMethod(class, insMethod2_Sel);
    
    if (!insMethod1 || !insMethod2) {
        return;
    }
    
    // 交换实例方法的实现
    method_exchangeImplementations(insMethod1, insMethod2);
    
    Method classMethod1 = class_getClassMethod(class, classMethod1_Sel);
    Method classMethod2 = class_getClassMethod(class, classMethod2_Sel);
    
    if (!classMethod1 || !classMethod2) {
        return;
    }
    
    // 交换实例方法的实现
    method_exchangeImplementations(classMethod1, classMethod2);
}
*/

+ (void)load {
    
    Class class = [self class];
    
    Method insMethod1 = class_getInstanceMethod(class, @selector(instanceMethod1));
    Method insMethod2 = class_getInstanceMethod(class, @selector(instanceMethod2));
    
    IMP method1_Imp = method_getImplementation(insMethod1);
    IMP method2_Imp = method_getImplementation(insMethod2);
    
    // 重新这是方法的实现
    // instanceMethod1 的实现设置为 instanceMethod2 方法的实现
    // instanceMethod2 的实现设置为 instanceMethod1 方法的实现
    
    method_setImplementation(insMethod1, method2_Imp);
    method_setImplementation(insMethod2, method1_Imp);
    
    Method classMethod1 = class_getClassMethod(class, @selector(classMethod1));
    Method classMethod2 = class_getClassMethod(class, @selector(classMethod2));
    
    IMP classMethod1_Imp = method_getImplementation(classMethod1);
    IMP classMethod2_Imp = method_getImplementation(classMethod2);
    
    method_setImplementation(classMethod1, classMethod2_Imp);
    method_setImplementation(classMethod2, classMethod1_Imp);
}

- (void)instanceMethod1 {
    NSLog(@"instanceMethod1");
}
- (void)instanceMethod2 {
    NSLog(@"instanceMethod2");
}
+ (void)classMethod1 {
    NSLog(@"classMethod1");
}
+ (void)classMethod2 {
    NSLog(@"classMethod2");
}

@end
