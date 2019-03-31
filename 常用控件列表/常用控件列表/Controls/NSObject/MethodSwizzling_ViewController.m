//
//  MethodSwizzling_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/27.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "MethodSwizzling_ViewController.h"
#import "MethodSwizzlingTest.h"
#import <objc/runtime.h>

@interface MethodSwizzling_ViewController ()

@end

@implementation MethodSwizzling_ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"__viewWillAppear: %@", self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MethodSwizzlingTest *t = [MethodSwizzlingTest new];
    
    [t instanceMethod1];
    [t instanceMethod2];
    
    [MethodSwizzlingTest classMethod1];
    [MethodSwizzlingTest classMethod2];
    
    // 4. 在运行时，为类添加新的方法
    // 获取方法编码类型
    Class class = [MethodSwizzlingTest class];
    
    Method newInsMethod1 = class_getInstanceMethod([self class], @selector(newInsMethod));
    SEL insMethod1_Sel = @selector(newInsMethod);
    IMP newInsMethod1_Imp = method_getImplementation(newInsMethod1);
    const char *newInsMethod1_Type = method_getTypeEncoding(newInsMethod1);
    
    // 为类添加新的实例方法和类方法
    BOOL isInsAdded = class_addMethod(class, insMethod1_Sel, newInsMethod1_Imp, newInsMethod1_Type);
    
    if (!isInsAdded) {
        NSLog(@"动态新增方法失败。");
        return;
    }
    
    [t newInsMethod];
}

- (void)newInsMethod {
    NSLog(@"hello world");
}

@end
