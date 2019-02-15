//
//  AlertView_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/23.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "AlertView_ViewController.h"
#import "AlertView_QuickMethod_ViewController.h"

@interface AlertView_ViewController ()

@end

@implementation AlertView_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"AlertView-快速创建弹窗视图控制器"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([AlertView_QuickMethod_ViewController class])];
}

@end
