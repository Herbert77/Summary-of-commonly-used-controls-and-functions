//
//  UILabel+Basic.h
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/2.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Basic)

- (void)configFontSize:(NSInteger)fontSize fontBold:(BOOL)isBold fontColor:(UIColor *)fontColor text:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
