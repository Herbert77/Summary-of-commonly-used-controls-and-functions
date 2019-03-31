//
//  ThreadLock_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/29.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "ThreadLock_ViewController.h"
#import "Person.h"

@interface ThreadLock_ViewController ()

@end

@implementation ThreadLock_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    // 当多个线程同时访问同一块资源时，为了避免出现数据错乱问题，可以使用“线程锁”来解决，在同一段时间段内，只允许一个线程来使用资源。
//    // 1. @synchronized
//    Person *p = [Person new];
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        @synchronized (p) {
//            NSLog(@"线程A = %@", [NSThread currentThread]);
//            p.name = @"herbert";
//            [NSThread sleepForTimeInterval:5.0];
//        }
//    });
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        @synchronized (p) {
//            NSLog(@"线程B = %@", [NSThread currentThread]);
//            p.name = @" ";
//        }
//    });
//
//    // NSLock 和 @synchronized() 具有相同的功能
//    // NSLock 对象中的 unlock 操作必须与 lock 操作使用相同的线程，否则会出现未知错误。
//    // 同一线程在 lock 之后，未 lock 之前，再次 lock 会导致永久性死锁！！
//
//    Person *p2 = [Person new];
//    NSLock *aLock = [NSLock new];
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        if ([aLock tryLock]) {
//            NSLog(@"线程A = %@", [NSThread currentThread]);
//            p.name = @"herbert";
//            [NSThread sleepForTimeInterval:5.0];
//            [aLock unlock];
//        }
//    });
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        if ([aLock tryLock]) {
//            NSLog(@"线程B = %@", [NSThread currentThread]);
//            p.name = @" ";
//            [aLock unlock];
//        }
//    });
    
    [self testGCD_Semaphore];
}

- (void)testGCD_Semaphore {
    
    Person *p = [Person new];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"线程A = %@", [NSThread currentThread]);
        p.name = @"herbert";
        [NSThread sleepForTimeInterval:2.0];
        // 信号加 1
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"线程B = %@", [NSThread currentThread]);
        p.name = @" ";
        // 信号加 1
        dispatch_semaphore_signal(semaphore);
    });
    
    
}

@end
