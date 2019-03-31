//
//  Dispatch_barrier_async_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/29.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "Dispatch_barrier_async_ViewController.h"

@interface Dispatch_barrier_async_ViewController ()

@end

@implementation Dispatch_barrier_async_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 通过添加 dispatch_barrier_async 添加的操作会暂时阻塞当前队列，仅在并发队列中起作用！
    // 可以使用 dispatch_barrier_async 实现类似 dispatch_group_t 组调度的效果。
    
    dispatch_queue_t queue = dispatch_queue_create("test.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    
    // 添加两个并发操作 A 和 B，A 和 B 会并发执行
    dispatch_async(queue, ^{
        NSLog(@"operationA");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"operationB");
    });
    
    // 添加 barrier 障碍操作，会等待前面的并发操作结束，并暂时阻塞后面的并发操作直到其完成
    dispatch_barrier_async(queue, ^{
        NSLog(@"OperationBarrier!!");
    });
    
    // 继续添加并发操作 C 和 D，要等待 barrier 障碍操作结束才能开始
    dispatch_async(queue, ^{
        NSLog(@"operationC");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"operationD");
    });
}

@end
