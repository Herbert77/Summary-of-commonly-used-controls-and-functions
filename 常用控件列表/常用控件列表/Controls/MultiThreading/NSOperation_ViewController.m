//
//  NSOperation_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/28.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "NSOperation_ViewController.h"

@interface NSOperation_ViewController ()

@end

@implementation NSOperation_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSOperation 是基于 GCD 的一个抽象基类，将线程封装成要执行的操作。
    
    // NSOperation 通常使用的是它的两个子类。NSBlockOperation 和 NSInvocationOperation。
    
    // NSInvocationOperation 初始化。 调用 start 方法，在当前线程执行。
    // 如果要异步执行避免阻塞当前线程，那么可以加入 NSOperationQueue 中异步执行。
    NSInvocationOperation *invoOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
    [invoOperation start];
    
    // NSBlockOperation 初始化
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSBlockOperation");
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"%@", [NSThread currentThread]);
    }];
    
    [blockOperation start];
    
    
    // NSOperation 可以设置各操作之间的依赖，以实现线程同步！！
    
    // 获取主队列（主线程）
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    
    NSOperation *c = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"Operation-C");
    }];
    
    NSOperation *a = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"Operation-A");
    }];
    
    NSOperation *b = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"Operation-B");
    }];
    
    // 添加依赖操作，c 依赖于 a 和 b，这样 c 一定会在 a 和 b 完成后才执行。
    [c addDependency:a];
    [c addDependency:b];
    
    // 添加操作到操作队列queue
    [queue addOperation:c];
    [queue addOperation:a];
    [queue addOperation:b];
    
    NSOperationQueue *queue1 = [NSOperationQueue currentQueue];
}

- (void)run {
    NSLog(@"run...");
}

@end
