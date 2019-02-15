//
//  UILabel+AutoScale.h
//  SmartCity
//
//  Created by ZCGC on 2017/8/22.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AutoScale)
/**
 根据375屏幕宽度的比例自动缩放字体大小.
 */
@property (nonatomic, assign) IBInspectable BOOL autoScaleFont;
@end
