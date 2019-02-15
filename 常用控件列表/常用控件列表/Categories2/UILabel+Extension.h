//
//  UILabel+Extension.h
//  ZXHT
//
//  Created by 洪欣 on 2017/6/17.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)
- (CGFloat)getTextWidth;
- (CGFloat)getTextHeight;

/**
 *  根据文本内容计算宽度并用约束来控制frame.(单行)
 *  frame的宽度为文本实际所占宽度.
 *  @return 计算后的宽度值
 */
-(CGFloat)fitWidth;

/**
 *  根据文本内容计算宽度并用约束来控制frame.(单行)
 *  @param os: [文本所占的宽度 + os] 即为frame的宽度. 范围:[FLT_MIN ~ FLT_MAX]
 *  @return 计算后的宽度值
 */
-(CGFloat)fitWidthOffset:(CGFloat)os;


/**
 *  在指定的宽度之内, 计算文本所占的高度.(单行/多行)
 *  @param width: frame的最大宽度.
 *  @return 计算后的高度值
 */
-(CGFloat)fitHeightForWidth:(CGFloat)width;

/**
 *  在指定的宽度之内, 计算文本所占的高度.(单行/多行)
 *  @param width: frame的最大宽度.
 *  @param os: 文本所占的高度 + os 即为frame的高度. 范围:[FLT_MIN ~ FLT_MAX]
 *  @return 计算后的高度值
 */
-(CGFloat)fitHeightForWidth:(CGFloat)width offset:(CGFloat)os;
@end
