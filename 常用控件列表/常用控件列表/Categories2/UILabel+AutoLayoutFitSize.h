//
//  UILabel+AutoLayoutFitSize.h
//  kkyingyu100k
//
//  Created by LSP on 16/7/14.
//  Copyright © 2016年 com.gjh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LayoutConstraints.h"


/**
 *  使用此分类的API, 需要预先设置宽度约束或高度约束.
 *  宽度/高度约束在 "UIView+Constraints.h" 中定义.
 *  设置约束时, 可在XIB或StoryBoard中关联, 也可以
 *  用代码初始化, 调用Setter即可.
 */
@interface UILabel (AutoLayoutFitSize)


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
