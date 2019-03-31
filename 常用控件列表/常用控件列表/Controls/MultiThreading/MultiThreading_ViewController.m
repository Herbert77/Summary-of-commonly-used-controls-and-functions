//
//  MultiThreading_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/28.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "MultiThreading_ViewController.h"
#import "NSThread_ViewController.h"
#import "GCD_ViewController.h"
#import "NSOperation_ViewController.h"
#import "Dispatch_barrier_async_ViewController.h"
#import "ThreadLock_ViewController.h"

@interface MultiThreading_ViewController ()

@end

@implementation MultiThreading_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"NSThread"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([NSThread_ViewController class])];
    
    [self.titleModuleArray addObject:@"GCD"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([GCD_ViewController class])];
    
    [self.titleModuleArray addObject:@"NSOperation"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([NSOperation_ViewController class])];
    
    [self.titleModuleArray addObject:@"Dispatch_barrier_async"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([Dispatch_barrier_async_ViewController class])];
    
    [self.titleModuleArray addObject:@"ThreadLock (线程锁)"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([ThreadLock_ViewController class])];
}

@end
