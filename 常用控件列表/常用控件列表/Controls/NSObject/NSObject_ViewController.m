//
//  NSObject_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/2/26.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "NSObject_ViewController.h"
#import "NSPredicate_ViewController.h"
#import "Bridge_ViewController.h"
#import "ObjMsgSend_ViewController.h"
#import "CopyIvarList_ViewController.h"
#import "AllocateClassPair_ViewController.h"
#import "CopyMethodList_ViewController.h"
#import "MethodSwizzling_ViewController.h"

@interface NSObject_ViewController ()

@end

@implementation NSObject_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"谓词（针对数据集合的一种逻辑筛选条件）"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([NSPredicate_ViewController class])];
    
    [self.titleModuleArray addObject:@"Foundation 对象和 Core Foundation 对象（桥接）"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([Bridge_ViewController class])];
    
    [self.titleModuleArray addObject:@"OC 中的消息传递机制"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([ObjMsgSend_ViewController class])];
    
    [self.titleModuleArray addObject:@"打印一个类中所有的实例变量"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([CopyIvarList_ViewController class])];
    
    [self.titleModuleArray addObject:@"使用 runtime 动态添加一个类"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([AllocateClassPair_ViewController class])];
    
    [self.titleModuleArray addObject:@"使用 runtime 暴力访问对象私有方法"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([CopyMethodList_ViewController class])];
    
    [self.titleModuleArray addObject:@"使用 Method Swizzling 交换两个方法的实现"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([MethodSwizzling_ViewController class])];
}

@end
