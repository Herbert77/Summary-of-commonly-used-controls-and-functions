//
//  UIButton+AutoScale.h
//  SmartCity
//
//  Created by LSP on 17/8/24.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AutoScale)

/**
 根据375的屏幕宽度来缩放titleLabel的字体(NormalState)
 */
@property (nonatomic, assign) IBInspectable BOOL autoScaleFont;
@end
