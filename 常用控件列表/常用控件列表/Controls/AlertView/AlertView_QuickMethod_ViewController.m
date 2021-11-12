//
//  AlertView_QuickMethod_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/23.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "AlertView_QuickMethod_ViewController.h"
//#import "UIAlertController+Extension.h"
#import "HHAlertController.h"
#import "TCAlertControllerUtilities.h"

@interface AlertView_QuickMethod_ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

@property (strong, nonatomic) HHAlertController *alertVc;

@end

@implementation AlertView_QuickMethod_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [[[[UIApplication sharedApplication] windows] objectAtIndex:0] addGestureRecognizer:tapGr];
}

- (void)tap {
    
//    __weak typeof(self) weakSelf = self;
//    [self.alertVc dismissViewControllerAnimated:NO completion:^{
//        [weakSelf.alertVc excuteConfirmBlock];
//    }];
    
    [[TCAlertControllerUtilities sharedInstance] dismissAlertController];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"[TCAlertControllerUtilities sharedInstance].alertVC = %@", [TCAlertControllerUtilities sharedInstance].alertController);
        
        
    });
}

- (IBAction)btn1Action:(id)sender {
    
//    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"标题" message:@"给我个棒棒糖🍭好不好？" confirm:@"确定" cancel:@"取消" confirmHandler:^(UIAlertAction *action) {
//        // confirm 点击后处理对应业务
//    }];
//    [self presentViewController:alertVc animated:YES completion:nil];
    
    NSLog(@"self : %@  [self.view getCurrentController] : %@", self, [self.view getCurrentViewController]);
    
    NSLog(@"rootVC : %@", [[[UIApplication sharedApplication] windows] objectAtIndex:0].rootViewController);
    __weak typeof(self) weakSelf = self;
    [[TCAlertControllerUtilities sharedInstance] showAlertControllerWithShowTime:-1.0 title:@"标题" message:@"给我个棒棒糖🍭好不好？" textFieldsConfigArr:@[@{TextFieldDefaultContent : @"", TextFieldKeyboardType : @(UIKeyboardTypeDefault)}] cancelBtnTitle:@"取消" otherBtnTitle:@"确定" inVC:[self.view getCurrentViewController] confirmHandler:^(UIAlertAction *action) {
        
        NSLog(@"123");
        [weakSelf abc];
        
    } cancelHandler:^(UIAlertAction * _Nonnull action) {
        
        
        
    }];
}

- (void)abc {
    
    [[TCAlertControllerUtilities sharedInstance] showAlertControllerWithShowTime:-1.0 title:@"888" message:@"给我个棒棒糖🍭好不好？" textFieldsConfigArr:@[@{TextFieldDefaultContent : @"", TextFieldKeyboardType : @(UIKeyboardTypeDefault)}] cancelBtnTitle:@"取消" otherBtnTitle:@"确定" inVC:[self.view getCurrentViewController] confirmHandler:^(UIAlertAction *action) {
        
        
        
    } cancelHandler:^(UIAlertAction * _Nonnull action) {
        
        
        
    }];
}

- (IBAction)btn2Action:(id)sender {
    
//    __weak typeof(self) weakSelf = self;
//    self.alertVc = [UIAlertController alertControllerWithTitle:@"标题" message:@"给我个棒棒糖🍭好不好？" confirm:@"确定" cancel:@"取消" confirmHandler:^(UIAlertAction *action) {
//        // confirm 点击后处理对应业务
//        weakSelf.alertVc = nil;
//        NSLog(@"self.alertVc : %@", self.alertVc);
//
//    } cancelHandler:^(UIAlertAction *action) {
//        // cancel 点击后处理对应业务
//
//    }];
//    [self presentViewController:self.alertVc animated:YES completion:nil];

}

- (IBAction)btn3Action:(id)sender {
    
    UIAlertView *rootAlertInfo = [[UIAlertView alloc] initWithTitle:@"di_alarm"
                                                    message:@"123123"
                                                   delegate:self
                                          cancelButtonTitle:@"confirm"
                                          otherButtonTitles:nil, nil];
    [rootAlertInfo show];
}

@end
