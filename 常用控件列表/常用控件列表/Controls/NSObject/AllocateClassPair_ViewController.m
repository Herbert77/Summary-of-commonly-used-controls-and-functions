//
//  AllocateClassPair_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/27.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "AllocateClassPair_ViewController.h"
#import <objc/runtime.h>

@interface AllocateClassPair_ViewController ()

@end

@implementation AllocateClassPair_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建一个新类 MyClass
    Class MyClass = objc_allocateClassPair([NSObject class], "MyClass", 0);
    // 添加实例变量
    class_addIvar(MyClass, "_address", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
    class_addIvar(MyClass, "_age", sizeof(NSUInteger), log2(sizeof(NSUInteger)), @encode(NSUInteger));
    // 注册类
    objc_registerClassPair(MyClass);
    
    // 创建实例
    id object = [[MyClass alloc] init];
    
    [object setValue:@"china" forKey:@"address"];
    [object setValue:@20 forKey:@"age"];
    
    NSLog(@"address=%@, age=%@", [object valueForKey:@"address"], [object valueForKey:@"age"]);
    
    // 当类或者它的子类的实例还存在，则不能调用 objc_disposeClassPair 方法
    object = nil;
    
    objc_disposeClassPair(MyClass);
}

@end
