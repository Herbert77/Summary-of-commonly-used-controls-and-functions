//
//  RAC_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/4/26.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "RAC_ViewController.h"
#import "RAC_Signal_ViewController.h"

@interface RAC_ViewController ()

@end

@implementation RAC_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@""];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([RAC_Signal_ViewController class])];
    
    
}

@end
