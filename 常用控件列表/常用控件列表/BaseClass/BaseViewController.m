//
//  BaseViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2018/1/30.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSString *className = NSStringFromClass([self class]);
    [self setTitle:className];
}

@end
