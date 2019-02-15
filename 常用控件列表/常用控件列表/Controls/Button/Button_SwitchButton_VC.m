//
//  Button_SwitchButton_VC.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/23.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "Button_SwitchButton_VC.h"
#import "HHSwitchButton.h"

@interface Button_SwitchButton_VC ()
@property (strong, nonatomic) HHSwitchButton *btn;                      /**< 纯代码创建的双状态按钮 */
@property (weak, nonatomic) IBOutlet HHSwitchButton *xibSwitchButton;   /**< xib创建的双状态按钮 */

@end

@implementation Button_SwitchButton_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configBtn];
    
    [self configXibSwitchButton];
}

- (void)configBtn {
    [self.btn setFrame:CGRectMake(100, 300, 100, 45)];
    [self.view addSubview:self.btn];
}

- (void)configXibSwitchButton {
    __weak typeof(self) weakSelf = self;
    [_xibSwitchButton configWithButtonType:HHSwitchButtonTypeLeftImage imageTitleSpace:10 OffTitle:@"关注" offTitleColor:[UIColor blackColor] offImageName:@"nc_下  拉" onTitle:@"已关注" onTitleColor:[UIColor blueColor] onImageName:@"nc_下  拉高亮" offSelectBlock:^(UIButton *btn) {
        
        [weakSelf requestAWithBlock:^(BOOL requestSuccess) {
            
            [weakSelf.xibSwitchButton recoverStatusWithRequestSuccess:requestSuccess];
        }];
        
    } onSelectBlock:^(UIButton *btn) {
        
        [weakSelf requestBWithBlock:^(BOOL requestSuccess) {
            
            [weakSelf.xibSwitchButton recoverStatusWithRequestSuccess:requestSuccess];
        }];
    }];
}

- (HHSwitchButton *)btn {
    if (!_btn) {
        __weak typeof(self) weakSelf = self;
        _btn = [[HHSwitchButton alloc] initWithBounds:CGRectMake(0, 0, 100, 45) buttonType:HHSwitchButtonTypeLeftImage imageTitleSpace:10 OffTitle:@"关注" offTitleColor:[UIColor blackColor] offImageName:@"nc_下  拉" onTitle:@"已关注" onTitleColor:[UIColor blueColor] onImageName:@"nc_下  拉高亮" offSelectBlock:^(UIButton *btn) {
            
            [weakSelf requestAWithBlock:^(BOOL requestSuccess) {
                
                [weakSelf.btn recoverStatusWithRequestSuccess:requestSuccess];
            }];
            
        } onSelectBlock:^(UIButton *btn) {
            
            [weakSelf requestBWithBlock:^(BOOL requestSuccess) {
                
                [weakSelf.btn recoverStatusWithRequestSuccess:requestSuccess];
            }];
        }];
    }
    return _btn;
}

- (void)requestAWithBlock:(void(^)(BOOL requestSuccess))requestBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        requestBlock(YES);
    });
}

- (void)requestBWithBlock:(void(^)(BOOL requestSuccess))requestBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        requestBlock(YES);
    });
}

@end
