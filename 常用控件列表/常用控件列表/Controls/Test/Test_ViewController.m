//
//  Test_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/2/18.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "Test_ViewController.h"
#import "AvailableMemory_ViewController.h"

@interface Test_ViewController ()

@end

@implementation Test_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"获取iOS内存使用情况。当前设备可用内存；当前任务占用内存。"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([AvailableMemory_ViewController class])];
}

@end
