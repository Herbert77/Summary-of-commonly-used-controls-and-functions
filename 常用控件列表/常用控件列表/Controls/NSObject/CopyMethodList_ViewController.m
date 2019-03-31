//
//  CopyMethodList_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/27.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "CopyMethodList_ViewController.h"
#import <objc/runtime.h>
#import "HHDog.h"

@interface CopyMethodList_ViewController ()

@end

@implementation CopyMethodList_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HHDog *dog = [HHDog new];
    
    // 获取类对象的方法列表
    unsigned int count = 0;
    Method *methods = class_copyMethodList([HHDog class], &count);
    
    for (int i=0; i<count; i++) {
        SEL sel = method_getName(methods[i]);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        if (sel == @selector(privateMethod)) {
            [dog performSelector:sel];
        }
        
#pragma clang diagnostic pop
        
    }
}

@end
