//
//  Bezier_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/24.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import "Bezier_ViewController.h"
#import "Bezier_GeneralUsage_ViewController.h"
@interface Bezier_ViewController ()

@end

@implementation Bezier_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"贝塞尔曲线的基本用法"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([Bezier_GeneralUsage_ViewController class])];
}

@end
