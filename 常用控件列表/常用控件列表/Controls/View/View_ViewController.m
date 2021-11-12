//
//  View_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/23.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "View_ViewController.h"
#import "View_AddShadow_ViewController.h"
#import "常用控件列表-Swift.h"

@interface View_ViewController ()

@end

@implementation View_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"View-添加阴影"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([View_AddShadow_ViewController class])];
    
    [self.titleModuleArray addObject:@"协议通知弹窗"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([NoticePopView_ViewController class])];
}

@end
