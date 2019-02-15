//
//  Button_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2018/1/30.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "Button_ViewController.h"
#import "Button_SwitchButton_VC.h"

@interface Button_ViewController ()

@end

@implementation Button_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // custom configuration
    [self.titleModuleArray addObject:@"UIButton-两种状态切换的按钮（使用场景：关注/已关注，对应请求两个接口的情形。）"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([Button_SwitchButton_VC class])];
}

@end
