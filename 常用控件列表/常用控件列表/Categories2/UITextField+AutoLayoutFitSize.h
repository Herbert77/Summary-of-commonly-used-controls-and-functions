//
//  UITextField+AutoLayoutFitSize.h
//  ZXHT
//
//  Created by LSP on 2018/11/27.
//  Copyright © 2018 zxht. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (AutoLayoutFitSize)

-(CGFloat)fitWidth;
-(CGFloat)fitWidthOffset:(CGFloat)os;
-(CGFloat)fitHeightForWidth:(CGFloat)width;

-(CGFloat)fitHeightForWidth:(CGFloat)width offset:(CGFloat)os;

@end

NS_ASSUME_NONNULL_END
