//
//  Slider_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2021/1/29.
//  Copyright © 2021 Herbert Hu. All rights reserved.
//

#import "Slider_ViewController.h"
#import "Slider_GeneralUsage_ViewController.h"

@interface Slider_ViewController ()

@end

@implementation Slider_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"Slider的基本用法"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([Slider_GeneralUsage_ViewController class])];
}

@end
