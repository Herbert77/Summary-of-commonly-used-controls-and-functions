//
//  UIViewController+Extension.m
//  ZXHT
//
//  Created by peng on 2017/6/12.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import "UIViewController+Extension.h"
#import "KSPhotoBrowser.h"
#import "SGAlertView.h"
#import <AVFoundation/AVFoundation.h>
#import "SGScanningQRCodeVC.h"
#import "Chat_SessionVC.h"
#import "Chat_ConfirmAddTeamVC.h"
#import "Chat_PersonalVC.h"

@implementation UIViewController (Extension)

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleDefault; // your own style
//}

- (void)ht_baseSetup
{
    self.view.backgroundColor = PPColorHex(PPThemeBgColor);
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bgImg"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)jumpQRVC { 
    // 1、 获取摄像设备 
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    MJWeakSelf
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        SGScanningQRCodeVC *scanningQRCodeVC = [[SGScanningQRCodeVC alloc] init];
                        scanningQRCodeVC.hidesBottomBarWhenPushed = YES;
                        [scanningQRCodeVC addBlock:^(NSData *data, NSDictionary *dic, NSArray *corners, NSString *stringValue) {
                            [weakSelf scanningComplete:stringValue];
                        }];
                        [self.navigationController pushViewController:scanningQRCodeVC animated:YES];
                    });
                } else {
                    SGAlertView *alertView = [SGAlertView alertViewWithTitle:@"⚠️ 警告" delegate:nil contentTitle:@"请去-> [设置 - 隐私 - 相机 - 智大师] 打开访问开关" alertViewBottomViewType:(SGAlertViewBottomViewTypeOne)];
                    [alertView show];
                }
            }];
            return;
        } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
            SGScanningQRCodeVC *vc = [[SGScanningQRCodeVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [(SGScanningQRCodeVC *)vc addBlock:^(NSData *data, NSDictionary *dic, NSArray *corners, NSString *stringValue) {
                [weakSelf scanningComplete:stringValue];
            }];
            [self.navigationController pushViewController:vc animated:YES];
        } else { // 用户拒绝当前应用访问相机
            SGAlertView *alertView = [SGAlertView alertViewWithTitle:@"⚠️ 警告" delegate:nil contentTitle:@"请去-> [设置 - 隐私 - 相机 - 智大师] 打开访问开关" alertViewBottomViewType:(SGAlertViewBottomViewTypeOne)];
            [alertView show];
        }
    } else {
        SGAlertView *alertView = [SGAlertView alertViewWithTitle:@"⚠️ 警告" delegate:nil contentTitle:@"获取摄像头失败" alertViewBottomViewType:(SGAlertViewBottomViewTypeOne)];
        [alertView show];
    }
}
- (void)scanningComplete:(NSString *)string {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL, kCFStringEncodingUTF8));
        NSString *urlStr = encodedString;
        NSArray *array = [urlStr componentsSeparatedByString:@"/"];
        if (array.count > 3) {
            NSString *appUrl;
            if ([HTTPAddress isEqualToString:@"http://appmain.izxcs.com:81/"] ||
                [HTTPAddress isEqualToString:@"http://118.190.87.31:81/"]) {
                // 测试主线
                appUrl = @"share.main.izxcs.com";
            }else if ([HTTPAddress isEqualToString:@"http://app.izxcs.com:81/"]) {
                // 正式环境
                appUrl = @"share.izxcs.com";
            }else if ([HTTPAddress isEqualToString:@"http://139.129.216.37:8081/"]) {
                // 测试分支
                appUrl = @"share.zxtest.izxcs.com";
            }else if ([HTTPAddress isEqualToString:@"http://139.129.167.239:8081/"]) {
                // 预上线
                appUrl = @"share.preline.izxcs.com";
            }
            
            if ([array[2] isEqualToString:appUrl] || [array[2] isEqualToString:@"writer.izxcs.com"] || [array[2] isEqualToString:@"writer.zxtest.izxcs.com"]) {
                if ([[[NSURL URLWithString:encodedString] path] isEqualToString:@"/bgapp/bgapp/appRegisterNew.html"]) {
                    ShowAlert(self, @"您已经下载了智大师哦~", nil, @"确定", nil);
                    return;
                }
                //获取参数列表
                NSString *propertys = [[NSURL URLWithString:encodedString] query];
                //进行字符串的拆分，通过&来拆分，把每个参数分开
                NSArray *subArray = [propertys componentsSeparatedByString:@"&"];
                //把subArray转换为字典
                //tempDic中存放一个URL中转换的键值对
                NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
                for (int j = 0 ; j < subArray.count; j++) {
                    //在通过=拆分键和值
                    NSArray *dicArray = [subArray[j] componentsSeparatedByString:@"="];
                    //给字典加入元素
                    [tempDic setObject:dicArray.lastObject forKey:dicArray.firstObject];
                }
                if ([tempDic[@"apptype"] isEqualToString:@"zdschat"]) {
                    if ([tempDic[@"subtype"] isEqualToString:@"personalcode"]) {
                        NSString *userCode = tempDic[@"usercode"];
                        Chat_PersonalVC *vc = [[Chat_PersonalVC alloc] init];
                        vc.zUserCode = userCode;
                        vc.isQRJump = YES;
                        vc.hidesBottomBarWhenPushed = YES;
                        [self.navigationController pushViewController:vc animated:YES];
                        return;
                    }else if ([tempDic[@"subtype"] isEqualToString:@"teamcode"]) {
                        NSString *teamId = tempDic[@"teamid"];
                        NSString *userId = tempDic[@"userid"];
                        if ([[NIMSDK sharedSDK].teamManager isMyTeam:teamId]) {
                            Chat_SessionVC *vc = [[Chat_SessionVC alloc] initWithSession:[NIMSession session:teamId type:NIMSessionTypeTeam]];
                            vc.hidesBottomBarWhenPushed = YES;
                            [self.navigationController pushViewController:vc animated:YES];
                            return;
                        }else {
                            Chat_ConfirmAddTeamVC *vc = [[Chat_ConfirmAddTeamVC alloc] init];
                            vc.teamId = teamId;
                            vc.userId = userId;
                            vc.hidesBottomBarWhenPushed = YES;
                            [self.navigationController pushViewController:vc animated:YES];
                            return;
                        }
                    }
                }
            }else if ([array[2] isEqualToString:@"wxapp.izxcs.com"]) {
                ShowAlert(self, @"请使用微信扫描二维码进入云店小程序哦~", nil, @"确定", nil);
                return;
            }else if ([array[2] isEqualToString:@"erweima.izxcs.com"] && [array[3] isEqualToString:@"erweima_zds.html"]) {
                ShowAlert(self, @"您已经下载了智大师哦~", nil, @"确定", nil);
                return;
            }
        }
        ShowAlert(self, @"这个不是智大师的二维码哦~", nil, @"确定", nil);
    });
}
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag
{
    [self presentViewController:viewControllerToPresent animated:flag completion:nil];
}
- (void)showPhotoBrowserWithURLs:(NSArray<NSString *> *)urls sourceViews:(NSArray<UIImageView *> *)sourceViews currentSourceView:(UIImageView *)currentSourceView currentIndex:(NSInteger)currentIndex delegate:(id)delegate {
    
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < urls.count; i++) {
        id scourceView = nil;
        if (sourceViews.count == urls.count) {
            scourceView = sourceViews[i];
        }
        if (i == currentIndex) {
            if (currentSourceView) {
                scourceView = currentSourceView;
            }
        }
        if (scourceView) {
            if (![scourceView isKindOfClass:[UIImageView class]]) {
                scourceView = nil;
            }
        }
        KSPhotoItem *item = [KSPhotoItem itemWithSourceView:scourceView imageUrl:[NSURL URLWithString:urls[i]]];
        [items addObject:item];
    }
    
    KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:currentIndex];
    browser.dismissalStyle = KSPhotoBrowserInteractiveDismissalStyleRotation;
    browser.backgroundStyle = KSPhotoBrowserBackgroundStyleBlur;
    browser.loadingStyle = KSPhotoBrowserImageLoadingStyleDeterminate;
    browser.pageindicatorStyle = KSPhotoBrowserPageIndicatorStyleDot;
    browser.bounces = YES;
    browser.delegate = delegate ?: self;
    [browser showFromViewController:self];
}
@end
