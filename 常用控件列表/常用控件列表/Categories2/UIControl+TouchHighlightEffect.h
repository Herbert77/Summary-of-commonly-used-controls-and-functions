//
//  UIControl+TouchHighlightEffect.h
//  SmartCity
//
//  Created by ZCGC on 2017/5/25.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (TouchHighlightEffect)

/**
 是否在按下时候显示高亮效果. 默认：NO。
 */
@property (nonatomic, assign) IBInspectable BOOL touchHighlightAble;
/**
 高亮（按住）时的颜色
 */
@property (nonatomic, retain) IBInspectable UIColor *highlightedBackgroundColor;
/**
 非高亮（松开）时的颜色
 */
@property (nonatomic, retain) IBInspectable UIColor *unHighlightedBackgroundColor;

@end
