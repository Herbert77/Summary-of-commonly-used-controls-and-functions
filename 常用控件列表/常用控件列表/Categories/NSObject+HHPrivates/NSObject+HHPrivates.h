//
//  NSObject+HHPrivates.h
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/2.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HHPrivates)

- (void)p_setShadowForViews:(nonnull NSArray <UIView *>*)viewsArr
               shadowOffset:(CGSize)shadowOffset
               shadowRadius:(CGFloat)shadowRadius
              shadowOpacity:(CGFloat)shadowOpacity
                shadowColor:(nullable UIColor *)shadowColor
               cornerRadius:(CGFloat)cornerRadius
                borderWidth:(CGFloat)borderWidth
                borderColor:(nullable UIColor *)borderColor;

- (void)p_setBorderForButtons:(nonnull NSArray <UIButton *>*)btnsArr
                  borderWidth:(NSInteger)borderWidth
                  borderColor:(UIColor *)borderColor
                 cornerRadius:(NSInteger)radius;

- (void)p_makeTheViews:(nullable NSArray <UIView *>*)viewsArr
               visible:(BOOL)isVisible
         andOtherViews:(nullable NSArray <UIView *>*)otherViewsArr
               visible:(BOOL)otherIsVisible;

@end

NS_ASSUME_NONNULL_END
