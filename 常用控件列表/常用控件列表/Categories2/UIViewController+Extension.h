//
//  UIViewController+Extension.h
//  ZXHT
//
//  Created by peng on 2017/6/12.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

- (void)ht_baseSetup;

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag;

/**
 显示图片浏览器

 @param urls 图片地址
 @param sourceViews 图片视图列表 与 图片地址一一对应   UIImageView 独享
 @param currentSourceView 当前的图片视图
 @param currentIndex 当前显示的图片下标
 @param delegate 代理 - 不传代表 自身
 */
- (void)showPhotoBrowserWithURLs:(NSArray<NSString *> *)urls sourceViews:(NSArray<UIImageView *> *)sourceViews currentSourceView:(UIImageView *)currentSourceView currentIndex:(NSInteger)currentIndex delegate:(id)delegate;


/**
 跳转扫一扫界面
 以push的方式
 */
- (void)jumpQRVC;
@end
