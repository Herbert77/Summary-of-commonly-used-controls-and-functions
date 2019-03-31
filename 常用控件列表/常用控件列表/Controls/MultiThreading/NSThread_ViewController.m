//
//  NSThread_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/28.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "NSThread_ViewController.h"

@interface NSThread_ViewController ()

@end

@implementation NSThread_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSThread 静态工具方法
    /**< 是否开启了当前线程 */
    BOOL isMultiThreaded = [NSThread isMultiThreaded];
    
    /**< 获取当前线程 */
    NSThread *currentThread = [NSThread currentThread];
    
    /**< 获取主线程 */
    NSThread *mainThread = [NSThread mainThread];
    
    /**< 睡眠线程 5s */
    //[NSThread sleepForTimeInterval:5.0];
    
    /**< 线程睡眠到指定时间，效果同上 */
    //[NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:5.0]];
    
    /**< 退出当前线程，主要不要在主线程调用，防止主线程被 kill 掉 */
    //[NSThread exit];
    
    /**< 线程实例对象创建与设置 */
    NSThread *newThread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    /**< 设置线程的优先级 */
    newThread.qualityOfService = NSQualityOfServiceUserInteractive;
    
    /**< 开启线程 */
    [newThread start];
    
    
}

- (void)run {
    NSLog(@"run...");
}

@end
