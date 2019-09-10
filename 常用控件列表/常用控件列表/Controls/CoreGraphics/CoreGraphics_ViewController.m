//
//  CoreGraphics_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/8/21.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "CoreGraphics_ViewController.h"
#import "CG_Demo1_ViewController.h"
#import "CG_Demo2_ViewController.h"

@interface CoreGraphics_ViewController ()

@end

@implementation CoreGraphics_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"Core Graphics Context"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([CG_Demo1_ViewController class])];
    
    [self.titleModuleArray addObject:@"WaveView"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([CG_Demo2_ViewController class])];
}

@end
