//
//  UITabBarController+UserBlackedNotification.m
//  ZXHT
//
//  Created by nrh on 2018/10/11.
//  Copyright © 2018 zxht. All rights reserved.
//

#import "UITabBarController+UserBlackedNotification.h"
#import "MC_DynamicViewController.h"
#import "MC_DynamicProfileViewController.h"
#import "MC_DynamicDetailViewController.h"
#import "SCForumViewController.h"
#import "SCMyForumListViewController.h"
#import "SCForumDetailViewController.h"
#import "CZVideoOrTopic.h"
#import "SCForumModel.h"
#import "MC_UserInfo.h"

@implementation UITabBarController (UserBlackedNotification)

+ (void)load {
    Method fromDidLoad = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method toDidLoad = class_getInstanceMethod([self class], @selector(viewDidLoadAddNotification));
    if (!class_addMethod([self class], @selector(viewDidLoadAddNotification), method_getImplementation(toDidLoad), method_getTypeEncoding(toDidLoad))) {
        method_exchangeImplementations(fromDidLoad, toDidLoad);
    }

    Method fromDealloc = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method toDealloc = class_getInstanceMethod([self class], @selector(deallocRemoveNotification));
    if (!class_addMethod([self class], @selector(deallocRemoveNotification), method_getImplementation(toDealloc), method_getTypeEncoding(toDealloc))) {
        method_exchangeImplementations(fromDealloc, toDealloc);
    }
}

- (void)viewDidLoadAddNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userBlackedNotification:) name:HTUserRelationshipOperateSuccessNotification object:nil];
    [self viewDidLoadAddNotification];
}

- (void)deallocRemoveNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:HTUserRelationshipOperateSuccessNotification object:nil];
    [self deallocRemoveNotification];
}

- (void)userBlackedNotification:(NSNotification *)sender {
    if ([UIApplication sharedApplication].delegate.window.rootViewController != self) {
        return;
    }
    
    NSDictionary *userInfo = sender.userInfo;
    HTUserRelationshipOperate operate = [userInfo[@"operate"] integerValue];
    NSString *zusercode = userInfo[@"zusercode"];
    if (operate == HTUserRelationshipOperateBlacked) {
        for (UINavigationController *navigatonController in self.viewControllers) {
            NSMutableArray *vcs = navigatonController.viewControllers.mutableCopy;
            NSMutableArray *removedVcs = [NSMutableArray array];
            for (UIViewController *vc in vcs) {
                if ([vc isKindOfClass:[MC_DynamicProfileViewController class]] ||
                    [vc isKindOfClass:[MC_DynamicDetailViewController class]]) {
                    CZVideoOrTopic *model = [vc valueForKey:@"model"];
                    if (model && [model isKindOfClass:[CZVideoOrTopic class]]) {
                        if ([model.sysUser.zusercode isEqualToString:zusercode]) {
                            [removedVcs addObject:vc];
                        }
                    }
                }
                
                if ([vc isKindOfClass:[SCForumDetailViewController class]]) {
                    SCForumModel *forum = [vc valueForKey:@"forum"];
                    if (forum && [forum isKindOfClass:[SCForumModel class]]) {
                        if ([forum.zuserCode isEqualToString:zusercode]) {
                            [removedVcs addObject:vc];
                        }
                    }
                }
                if ([vc isKindOfClass:[SCMyForumListViewController class]]) {
                    MC_UserInfo *userModel = [vc valueForKey:@"userModel"];
                    if (userModel && [userModel isKindOfClass:[MC_UserInfo class]]) {
                        if ([userModel.zusercode isEqualToString:zusercode]) {
                            [removedVcs addObject:vc];
                        }
                    }
                }
            }
            [vcs removeObjectsInArray:removedVcs];
            [navigatonController setViewControllers:vcs animated:YES];
        }
    }
}



@end
