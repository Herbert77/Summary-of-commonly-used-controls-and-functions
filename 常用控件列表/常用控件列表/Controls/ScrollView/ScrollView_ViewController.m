//
//  ScrollView_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/2/18.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "ScrollView_ViewController.h"
#import "ScrollView_Layout_ViewController.h"

@interface ScrollView_ViewController ()

@end

@implementation ScrollView_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"往 scrollView 上添加多个子视图时的布局方案"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([ScrollView_Layout_ViewController class])];
}

@end
