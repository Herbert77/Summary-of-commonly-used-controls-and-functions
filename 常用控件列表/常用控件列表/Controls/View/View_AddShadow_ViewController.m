//
//  View_AddShadow_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/23.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "View_AddShadow_ViewController.h"
#import "UIView+Shadow.h"
#import "UIView+XIBCreation.h"

@interface View_AddShadow_ViewController ()
@property (weak, nonatomic) IBOutlet UIView *view_1;
@property (weak, nonatomic) IBOutlet UIView *view_2;
@end

@implementation View_AddShadow_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [UIView addShadowToView:self.view_1 withOpacity:0.5 shadowRadius:6.0 andCornerRadius:8.0];
    
    [UIView addShadowToView:self.view_2 withShadowColor:[UIColor purpleColor] shadowOffset:CGSizeMake(2, 2) opacity:0.5 shadowRadius:4.0 andCornerRadius:8.0];
}

@end
