//
//  UIView+Extension.h
//  ZXHT
//
//  Created by peng on 2017/3/27.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)


/**
 统一设置导航栏标题(ZXHT)
 */
+ (UILabel *)setupNavTitle:(NSString *)text;

//- (UITapGestureRecognizer *)addTapGestureRecognizerWithTarget:(id)target action:(SEL)action;

/**
 获取指定类型的父控件
 */
- (UIView *)parentViewWithType:(Class)viewType;
/** 获取控件当前父控制器 */
- (UIViewController *) firstAvailableUIViewController;
/**
 添加与view等宽的上方线条
 */
-(UIView*)addTopLineWithColor:(UIColor*)color andHeight:(CGFloat)height;

/**
 添加与view等宽的下方线条
 */
- (UIView*)addBottomLineWithColor:(UIColor*)color andHeight:(CGFloat)height;

/**
 添加与view等高的左方线条
 */
- (UIView*)addLeftLineWithColor:(UIColor *)color andWidth:(CGFloat)width;

/**
 添加与view等高的右方线条
 */
- (UIView*)addRightLineWithColor:(UIColor *)color andWidth:(CGFloat)width;
/**
 *  UIView 添加点击事件
 */
- (void)addTarget:(id)target action:(SEL)action;

- (UIViewController*)currentViewController;

/**
 显示图片浏览器
 
 @param urls 图片地址
 @param sourceViews 图片视图列表 与 图片地址一一对应  UIImageView 对象
 @param currentSourceView 当前的图片视图
 @param currentIndex 当前显示的图片下标
 @param delegate 代理 - 不传代表 自身
 */
- (void)showPhotoBrowserWithURLs:(NSArray<NSString *> *)urls sourceViews:(NSArray<UIImageView *> *)sourceViews currentSourceView:(UIImageView *)currentSourceView currentIndex:(NSInteger)currentIndex delegate:(id)delegate;

@end
