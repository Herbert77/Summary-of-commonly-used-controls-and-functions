//
//  UITextField+InputLimits.h
//  textfieldCategory
//
//  Created by Cz on 2018/12/29.
//  Copyright © 2018 Cz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (InputLimits)

/**
 是否是输入价格
 */
@property (nonatomic, assign) BOOL isPriceInput;

/**
 是否是输入纯文字
 */
@property (nonatomic, assign) BOOL isPureNumber;

/**
 价格最大位数 or 纯文字最大位数 默认9位
 */
@property (nonatomic, assign) NSInteger maxpriceLength;

/**
 是否限制输入emoji
 */
@property (nonatomic, assign) BOOL isLimitEmoji;

/**
 是否限制输入特殊符号
 */
@property (nonatomic, assign) BOOL isLimitSpecialSymbol;

/**
 最大文字长度
 */
@property (nonatomic, assign) NSInteger maxTextLength;

/**
 初始化方法
 */
- (instancetype)init_inputLimits;

@end

NS_ASSUME_NONNULL_END
