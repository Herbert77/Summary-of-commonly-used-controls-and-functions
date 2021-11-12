//
//  UIView+CurrentController.h
//  IP3088M
//
//  Created by Herbert Hu on 2019/10/24.
//  Copyright © 2019年 tecomtech. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CurrentController)

/** 获取当前View的控制器对象 */
- (UIViewController *)getCurrentViewController;

@end

NS_ASSUME_NONNULL_END
