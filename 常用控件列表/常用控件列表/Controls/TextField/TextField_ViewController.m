//
//  TextField_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2018/1/30.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "TextField_ViewController.h"
#import "TextField_LimitInput_VC.h"

@interface TextField_ViewController ()
@property (strong, nonatomic) UIButton *goodButton;
@end

@implementation TextField_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@"TextField-限制输入文本的长度及内容"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([TextField_LimitInput_VC class])];
}

@end
