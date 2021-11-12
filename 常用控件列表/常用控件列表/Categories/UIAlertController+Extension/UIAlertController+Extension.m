//
//  UIAlertController+Extension.m
//  ZXHT
//
//  Created by peng on 2017/12/12.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import "UIAlertController+Extension.h"

@implementation UIAlertController (Extension)

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message confirm:(NSString *)confirmTitle cancel:(NSString *)cancelTitle confirmHandler:(void (^)(UIAlertAction *action))confirmHandler
{
    return [self alertControllerWithTitle:title message:message confirm:confirmTitle cancel:cancelTitle confirmHandler:confirmHandler cancelHandler:nil];
}

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message confirm:(NSString *)confirmTitle cancel:(NSString *)cancelTitle confirmHandler:(void (^)(UIAlertAction *action))confirmHandler cancelHandler:(void (^)(UIAlertAction *action))cancelHandler
{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDestructive handler:confirmHandler];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:cancelHandler];
    [ac addAction:cancel];
    [ac addAction:confirm];
    return ac;
}

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message confirm:(NSString *)confirmTitle confirmHandler:(void (^)(UIAlertAction *action))confirmHandler {
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:confirmHandler];
    [ac addAction:confirm];
    return ac;
}

@end
