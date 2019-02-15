//
//  AlertView_QuickMethod_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/23.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "AlertView_QuickMethod_ViewController.h"
#import "UIAlertController+Extension.h"

@interface AlertView_QuickMethod_ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@end

@implementation AlertView_QuickMethod_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)btn1Action:(id)sender {
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"标题" message:@"给我个棒棒糖🍭好不好？" confirm:@"确定" cancel:@"取消" confirmHandler:^(UIAlertAction *action) {
        // confirm 点击后处理对应业务
    }];
    [self presentViewController:alertVc animated:YES completion:nil];
}

- (IBAction)btn2Action:(id)sender {
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"标题" message:@"给我个棒棒糖🍭好不好？" confirm:@"确定" cancel:@"取消" confirmHandler:^(UIAlertAction *action) {
        // confirm 点击后处理对应业务
        
    } cancelHandler:^(UIAlertAction *action) {
        // cancel 点击后处理对应业务
        
    }];
    [self presentViewController:alertVc animated:YES completion:nil];
}

@end
