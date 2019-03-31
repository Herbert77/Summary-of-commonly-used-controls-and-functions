//
//  GCD_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/28.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "GCD_ViewController.h"

const char *concurrentQueueLabel = "demo.gcd.concurrent_queue";
const char *serialQueueLabel = "demo.gcd.serial_queue";

@interface GCD_ViewController ()

@end

@implementation GCD_ViewController

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static id shareInstance = nil;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 提交异步任务
    NSLog(@"开始提交异步任务。。");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        /**< 耗时任务。。 */
        [NSThread sleepForTimeInterval:2];
    });
    
    NSLog(@"异步任务提交成功。");
    
    // 提交同步任务
    NSLog(@"开始提交同步任务。。");
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        /**< 耗时任务。。 */
        [NSThread sleepForTimeInterval:2];
    });
    
    NSLog(@"同步任务提交成功。");
    
    
    // 创建一个并发队列
    dispatch_queue_t concurrent_queue = dispatch_queue_create(concurrentQueueLabel, DISPATCH_QUEUE_CONCURRENT);
    
    // 创建一个串行队列
    dispatch_queue_t serial_queue = dispatch_queue_create(serialQueueLabel, DISPATCH_QUEUE_SERIAL);
    
    // 获取主队列
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    // 获取不同优先级的全局队列（优先级从高到低）
    dispatch_queue_t queue_high = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t queue_default = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue_low = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_queue_t queue_background = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    // dispatch_once_t 这个函数控制指定代码只会被执行一次！
    
    // dispatch_after 定时延迟执行提交的任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 延后要执行的任务
    });
    
    // dispatch_group_t 组调度：可以实现等待一组操作都完成后，执行后续的操作。
    dispatch_queue_t queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        // 任务1
    });
    dispatch_group_async(group, queue, ^{
        // 任务2
    });
    dispatch_group_async(group, queue, ^{
        // 任务3
    });
    
    dispatch_group_notify(group, queue, ^{
        
        // 后续操作
    });
    
    // 同步代码到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        // 在主线程进行UI层面的操作
    });
    
}

@end
