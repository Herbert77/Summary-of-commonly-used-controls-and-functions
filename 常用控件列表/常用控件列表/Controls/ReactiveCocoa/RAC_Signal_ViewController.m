//
//  RAC_Signal_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/4/26.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "RAC_Signal_ViewController.h"

@interface RAC_Signal_ViewController ()

@end

@implementation RAC_Signal_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        NSLog(@"1");
        
        RACDisposable *dis = [RACDisposable disposableWithBlock:^{
            NSLog(@"disposable");
        }];
        
        [subscriber sendNext:@"I send next data"];
        
        return dis;
    }];
    
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    /*
     RACSignal的处理流程:
        创建信号的block会在订阅信号的时候调用；
        订阅信号的block会在订阅者发布信息的时候调用。
     */
}

@end
