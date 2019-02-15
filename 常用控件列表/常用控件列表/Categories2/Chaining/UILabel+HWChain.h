//
//  UILabel+HWChain.h
//  HomeWork
//
//  Created by apple on 2017/11/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HWChain)

/** 字体颜色 */
- (UILabel *(^)(UIColor *color))chainColor;
/** 文本内容 */
- (UILabel *(^)(NSString *text))chainText;
/** 字体大小 */
- (UILabel *(^)(UIFont *font))chainFont;
/** 行数 */
- (UILabel *(^)(NSInteger lines))chainLines;
/** 文字显示位置 */
- (UILabel *(^)(NSTextAlignment alignment))chainAlignment;
@end
