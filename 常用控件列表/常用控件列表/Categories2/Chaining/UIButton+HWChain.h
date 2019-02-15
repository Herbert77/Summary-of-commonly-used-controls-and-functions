//
//  UIButton+HWChain.h
//  HomeWork
//
//  Created by apple on 2017/11/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HWChain)

/** 正常情况下的标题 */
- (UIButton *(^)(NSString *title))chainNormalTitle;
/** 正常时标题颜色 */
- (UIButton *(^)(UIColor *color))chainNormalTitleColor;
/** 正常的按钮图片名 */
- (UIButton *(^)(NSString *imageName))chainNormalImageName;
/** 正常的背景图片名 */
- (UIButton *(^)(NSString *imageName))chainNormalBackgroundIamgeName;
/** 正常的按钮图片 */
- (UIButton *(^)(UIImage *image))chainNormalImage;
/** 正常的背景图片 */
- (UIButton *(^)(UIImage *image))chainNormalBgroundIamge;
/** 按钮字体大小 */
- (UIButton *(^)(UIFont *font))chainTitleFont;
/** 按钮添加事件 */
- (UIButton *(^)(id target, NSString *methond, UIControlEvents event))chainEvent;


@end
