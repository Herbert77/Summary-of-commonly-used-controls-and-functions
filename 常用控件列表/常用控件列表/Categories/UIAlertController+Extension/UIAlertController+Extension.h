//
//  UIAlertController+Extension.h
//  ZXHT
//
//  Created by peng on 2017/12/12.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extension)

/**
 alert弹框(不带取消回调)
 */
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message confirm:(NSString *)confirmTitle cancel:(NSString *)cancelTitle confirmHandler:(void (^)(UIAlertAction *action))confirmHandler;

/**
 alert弹框(带取消回调)
 */
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message confirm:(NSString *)confirmTitle cancel:(NSString *)cancelTitle confirmHandler:(void (^)(UIAlertAction *action))confirmHandler cancelHandler:(void (^)(UIAlertAction *action))cancelHandler;

/**
 alert弹框(不带取消按钮，确认按钮为系统蓝色)
 */
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message confirm:(NSString *)confirmTitle confirmHandler:(void (^)(UIAlertAction *action))confirmHandler;

@end
