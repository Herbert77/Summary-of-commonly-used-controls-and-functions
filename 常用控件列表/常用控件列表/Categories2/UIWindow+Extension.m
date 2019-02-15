//
//  UIWindow+Extension.m
//  ZXHT
//
//  Created by apple on 2018/7/5.
//  Copyright © 2018年 zxht. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "HTAppVersionTool.h"
#import "HTNewFeaturesViewController.h"
#import "HTLoginTool.h"
#import "CYLTabBarController.h"

#import "CZMyShopViewController.h"
#import "CS_ShopHomepageVC.h"
//#import "HTWorkBenchHomeVC.h"
#import "HTWorkBenchHomeViewController.h"
#import "CF_EnjoyEemoVC.h"
#import "Chat_SessionListVC.h"
#import "HTMeViewController.h"
#import "MC_DynamicViewController.h"
#import "MemoSuspendView.h"
#import "HTMemoSelectSexVC.h"
#import "Chat_TeamMeetingCalleeInfo.h"
#import "Chat_CustomSysNotificationSender.h"
#import "Chat_TeamMeetingCallingVC.h"
#import "Chat_ConversationManager.h"
#import "HTTools.h"
#import "SPOfficeAutomationTabVC.h"
#import "ZYB_OA_TabBarController.h"
#import "OA_PushJumpConfiguration.h"
#import "Chat_PushJumpConfiguration.h"

@implementation UIWindow (Extension)

- (void)switchRootController{
    if ([[HTAppVersionTool shareAppVersionTool] isAppFirstLoad]) {
        HTNewFeaturesViewController *newFeaturesVC = [[HTNewFeaturesViewController alloc] init];
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 1; i < 4; i++) {
            [arr addObject:[NSString stringWithFormat:@"newFeatures_%d", i]];
        }
        newFeaturesVC.images = arr;
        __weak typeof(self) weakSelf = self;
        newFeaturesVC.btnClickCallBack = ^{
            [weakSelf setRootVC];
            [[HTAppVersionTool shareAppVersionTool] checkServerNewFeatures];
        };
        self.rootViewController = newFeaturesVC;
    } else {
        [self setRootVC];
    }
}

- (void)setRootVC{
//    NSDate *dateNow = [NSDate date];
//    NSDate *lastTime = (NSDate *)[PPUserDefaults objectForKey:LastLoginTime];
    
//    NSTimeInterval interval = [dateNow timeIntervalSinceDate:lastTime];
    
    BOOL autoLogin = [PPUserDefaults boolForKey:PPUserDefaultIsLogin];
    
    NSString *userName = [PPUserDefaults objectForKey:PPUserDefaultUserName];
    NSString *passWord = [PPUserDefaults objectForKey:PPUserDefaultPassWord];
    
    if ([HTUserManager shareUserManager].isLogin) {
        [self setTabVC];
    } else if (autoLogin && userName && passWord) { // 有账号、密码，自动登录，设置tab为根控制器
        //            [self autoLogin:userName password:passWord];
        [self setTabVC];
    } else { // 没有账号密码，现在登录控制器，用户手动登录
        [self setLoginVC];
        //            [self setTabVC];
    }
}

- (void)setTabVC{
    self.rootViewController = [self setupViewControllers];
    [HTUserManager shareUserManager].setupTabbarComplete = YES;
    // 判断登录之前是否有收到视频会议邀请通知
    if ([HTUserManager shareUserManager].hasVideoMeeting && ![[Chat_ConversationManager shareConversationManager] shouldResponseBusy]) {
        [HTUserManager shareUserManager].shortcutItemType = nil;
        [HTUserManager shareUserManager].pushJumpUserInfo = nil;
        
        [Chat_PushJumpConfiguration jumpvideoMeeting];
        
        [HTUserManager shareUserManager].hasVideoMeeting = NO;
        [HTUserManager shareUserManager].videoMeetingModel = nil;
        return;
    }
    if ([HTUserManager shareUserManager].shortcutItemType && [HTUserManager shareUserManager].login) {
        [OA_PushJumpConfiguration jumpWithShortcutItemType:[HTUserManager shareUserManager].shortcutItemType];
        [HTUserManager shareUserManager].shortcutItemType = nil;
    }else if ([HTUserManager shareUserManager].pushJumpUserInfo && [HTUserManager shareUserManager].login) {
        [OA_PushJumpConfiguration jumpWithUserInfo:[HTUserManager shareUserManager].pushJumpUserInfo];
        [HTUserManager shareUserManager].pushJumpUserInfo = nil;
    }
}
- (NSArray *)arrayDeleteObj:(NSArray *)array obj:(id)obj {
    if (obj) {
        if ([array containsObject:obj]) {
            NSMutableArray *tempArray = [NSMutableArray arrayWithArray:array];
            [tempArray removeObject:obj];
            return tempArray.copy;
        }
    }
    return array;
}
- (void)setLoginVC{
    HTLoginViewController *loginVC = [HTLoginViewController loginViewController];
    
    __weak typeof(self) weakSelf = self;
    loginVC.loginSuccessCallBack = ^{
        //            [self customizeInterface];
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf setTabVC];
//        strongSelf.rootViewController = [strongSelf setupViewControllers];
    };
    
//    HTMemoSelectSexVC *vc = [[HTMemoSelectSexVC alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [nav.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    self.rootViewController = nav;
    loginVC.hiddenCloseBtn = YES;
    [HTUserManager shareUserManager].setupTabbarComplete = NO;;
}

- (void)autoLogin:(NSString *)userName password:(NSString *)password{
    
    [[HTLoginTool shareLoginTool] loginWithUserName:userName passWord:password callBack:^{
        
    } notActive:^(NSString *msg) {
        
    } failure:^(NSString *msg) {
        
    }];
    
}


/**
 *  tabBarItem 的选中和不选中文字属性、背景图片
 */
- (void)customizeInterface
{
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = PPColorHex(@"#999999");
    normalAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:11];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = PPColorHex(@"#3c82ee");
    selectedAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:11];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    
}

#pragma mark - CYLTabBarController
- (CYLTabBarController *)setupViewControllers {
    
    [self customizeInterface];
    
    //    if (PPIsAddLive) {
    //        // 注册中间的按钮
    //        [HTPlusButton registerPlusButton];
    //    }
    
    CF_EnjoyEemoVC *vc = [[CF_EnjoyEemoVC alloc] init];
    UIViewController *nav1 = [[HTNavigationController alloc] initWithRootViewController:vc];
    
    NSString *type = [PPUserDefaults objectForKey:CZCloudShopType];
    if (!type) {
        type = CZMyShopViewControllerDiscovery;
    }
    CZMyShopViewController *vc2 = [[CZMyShopViewController alloc] initWithType:type];
    UIViewController *nav2 = [[HTNavigationController alloc] initWithRootViewController:vc2];
    
//    UIViewController *nav3 = [[HTNavigationController alloc] initWithRootViewController:[[CZMasterCircleViewController alloc] init]];
    UIViewController *nav3 = [[HTNavigationController alloc] initWithRootViewController:[[MC_DynamicViewController alloc] init]];
    
    UIViewController *nav4 = [[UINavigationController alloc] initWithRootViewController:[[Chat_SessionListVC alloc] init]];
    
    UIViewController *nav5 = [[HTNavigationController alloc] initWithRootViewController:[[HTMeViewController alloc] init]];
    
    
    //
    
    
    
    
    
    
    CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
    tabBarController.delegate = self;
    [self customizeTabBarForController:tabBarController];
    
    [tabBarController setViewControllers:@[
                                           nav1,
                                           nav2,
                                           nav3,
                                           nav4,
                                           nav5
                                           ]];
    return tabBarController;
}


/*
 *
 在`-setViewControllers:`之前设置TabBar的属性，
 *
 */
- (void)customizeTabBarForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"工作台",
                            CYLTabBarItemImage : @"tabBarIcon_gzt_wdj",
                            CYLTabBarItemSelectedImage : @"tabBarIcon_gzt_dj",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"云店",
                            CYLTabBarItemImage : @"tabBarIcon_yd_wdj",
                            CYLTabBarItemSelectedImage : @"tabBarIcon_yd_dj",
                            };
    
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"大师圈",
                            CYLTabBarItemImage : @"tabBarIcon_dsq_dj",
                            CYLTabBarItemSelectedImage : @"tabBarIcon_dsq_wdj",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"聊天",
                            CYLTabBarItemImage : @"tabBarIcon_xx_wdj",
                            CYLTabBarItemSelectedImage : @"tabBarIcon_xx_dj",
                            };
    NSDictionary *dict5 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"tabBarIcon_wd_wdj",
                            CYLTabBarItemSelectedImage : @"tabBarIcon_wd_dj",
                            };
    
    
    
    
    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3, dict4, dict5];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control
{
    UIViewController *vc = tabBarController.selectedViewController.childViewControllers[0];
    if (![vc isKindOfClass:[CF_EnjoyEemoVC class]]) {
        [MemoSuspendView hide];
    }
    
//        if ([HTUserManager shareUserManager].login) {
//            if ([vc isKindOfClass:[HTWorkBenchHomeVC class]] == NO) {
//                HTNavigationController *nav = tabBarController.childViewControllers.lastObject;
//                HTWorkBenchHomeVC *workBenchHomeVC = nav.childViewControllers.firstObject;
//                if (workBenchHomeVC.webViewURL.length && workBenchHomeVC.switchOver == NO) {
//                    workBenchHomeVC.switchOver = YES;
//                }
//            }
//
//            return;
//        }
//        if ( [vc isKindOfClass:[HTWorkBenchHomeVC class]]) {
//
//            [[HTUserManager shareUserManager] judgmentLoginStatusWithViewController:vc successCallBack:^{
//
//            }];
//            tabBarController.selectedIndex = tabBarController.lastSelectedIndex;
//        }
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    HTNavigationController *nav = (HTNavigationController *)tabBarController.selectedViewController;
    if (viewController == tabBarController.viewControllers.firstObject && [nav.visibleViewController isKindOfClass:[HTWorkBenchHomeViewController class]]) {
        return NO;
    }
    return YES;
}

@end
