//
//  UIViewController+CYLTabBarControllerExtention.m
//  CYLTabBarController
//
//  Created by 微博@iOS程序犭袁 ( http://weibo.com/luohanchenyilong/ ) on 16/2/26.
//  Copyright © 2016年 https://github.com/ChenYilong .All rights reserved.
//

#import "UIViewController+HXTabBarControllerExtention.h"

@implementation UIViewController (HXTabBarControllerExtention)

- (UIViewController *)hx_popSelectTabBarChildViewControllerAtIndex:(NSUInteger)index {
    [self checkTabBarChildControllerValidityAtIndex:index];
    [self.navigationController popToRootViewControllerAnimated:NO];
    UITabBarController *tabBarController = self.tabBarController;
    tabBarController.selectedIndex = index;
    UIViewController *selectedTabBarChildViewController = tabBarController.selectedViewController;
    BOOL isNavigationController = [[selectedTabBarChildViewController class] isSubclassOfClass:[UINavigationController class]];
    if (isNavigationController) {
        return ((UINavigationController *)selectedTabBarChildViewController).viewControllers[0];
    }
    return selectedTabBarChildViewController;
}

- (void)hx_popSelectTabBarChildViewControllerAtIndex:(NSUInteger)index WithTabBarController:(UITabBarController *)tabBarController completion:(HXPopSelectTabBarChildViewControllerCompletion)completion
{
    UIViewController *selectedTabBarChildViewController = [self hx_popSelectTabBarChildViewControllerAtIndex:index WithTabBarController:tabBarController];
    dispatch_async(dispatch_get_main_queue(), ^{
        !completion ?: completion(selectedTabBarChildViewController);
    });
}

- (UIViewController *)hx_popSelectTabBarChildViewControllerAtIndex:(NSUInteger)index WithTabBarController:(UITabBarController *)tabBar {
    [self checkTabBarChildControllerValidityAtIndex:index];
    [self.navigationController popToRootViewControllerAnimated:NO];
    UITabBarController *tabBarController = tabBar;
    tabBarController.selectedIndex = index;
    UIViewController *selectedTabBarChildViewController = tabBarController.selectedViewController;
    BOOL isNavigationController = [[selectedTabBarChildViewController class] isSubclassOfClass:[UINavigationController class]];
    if (isNavigationController) {
        return ((UINavigationController *)selectedTabBarChildViewController).viewControllers[0];
    }
    return selectedTabBarChildViewController;
}

- (UIViewController *)hx_popSelectTabBarChildViewControllerForClassType:(Class)classType {
    UITabBarController *tabBarController = self.tabBarController;
    __block NSInteger atIndex = NSNotFound;
    [tabBarController.viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id obj_ = nil;
        BOOL isNavigationController = [[tabBarController.viewControllers[idx] class] isSubclassOfClass:[UINavigationController class]];
        if (isNavigationController) {
            obj_ = ((UINavigationController *)obj).viewControllers[0];
        } else {
            obj_ = obj;
        }
        if ([obj_ isKindOfClass:classType]) {
            atIndex = idx;
            *stop = YES;
            return;
        }
    }];
    
    return [self hx_popSelectTabBarChildViewControllerAtIndex:atIndex];
}

- (void)hx_popSelectTabBarChildViewControllerForClassType:(Class)classType
                                                completion:(HXPopSelectTabBarChildViewControllerCompletion)completion {
    UIViewController *selectedTabBarChildViewController = [self hx_popSelectTabBarChildViewControllerForClassType:classType];
    dispatch_async(dispatch_get_main_queue(), ^{
        !completion ?: completion(selectedTabBarChildViewController);
    });
}

- (void)checkTabBarChildControllerValidityAtIndex:(NSUInteger)index {
    UITabBarController *tabBarController = self.tabBarController;
    @try {
        UIViewController *viewController;
        viewController = tabBarController.viewControllers[index];
    } @catch (NSException *exception) {
        NSString *formatString = @"\n\n\
        ------ BEGIN NSException Log ---------------------------------------------------------------------\n \
        class name: %@                                                                                    \n \
        ------line: %@                                                                                    \n \
        ----reason: The Class Type or the index or its NavigationController you pass in method `-cyl_popSelectTabBarChildViewControllerAtIndex` or `-cyl_popSelectTabBarChildViewControllerForClassType` is not the item of CYLTabBarViewController \n \
        ------ END ---------------------------------------------------------------------------------------\n\n";
        NSString *reason = [NSString stringWithFormat:formatString,
                            @(__PRETTY_FUNCTION__),
                            @(__LINE__)];
        @throw [NSException exceptionWithName:NSGenericException
                                       reason:reason
                                     userInfo:nil];
    }
}

@end
