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

@interface NSObject_ViewController ()

@end

@implementation NSObject_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"谓词（针对数据集合的一种逻辑筛选条件）"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([NSPredicate_ViewController class])];
    
    [self.titleModuleArray addObject:@" Foundation 对象和 Core Foundation 对象（桥接）"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([Bridge_ViewController class])];
}

@end
