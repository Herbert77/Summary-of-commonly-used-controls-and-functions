//
//  BaseTabBarController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/10/22.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "BaseTabBarController.h"
#import "View_AddShadow_ViewController.h"
#import "AlertView_QuickMethod_ViewController.h"

@interface BaseTabBarController ()
@property (strong, nonatomic) View_AddShadow_ViewController *shadowVC;
@property (strong, nonatomic) AlertView_QuickMethod_ViewController *alertVC;
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _shadowVC = [[View_AddShadow_ViewController alloc] init];
    _alertVC = [[AlertView_QuickMethod_ViewController alloc] init];
    
    [self setViewControllers:@[_shadowVC, _alertVC]];
}

@end
