//
//  UIImage+Blur.h
//  SmartCity
//
//  Created by 洪欣 on 16/5/7.
//  Copyright © 2016年 NRH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Blur)
- (UIImage *)fixOrientation;
- (UIImage *)normalizedImage;
+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;
// 裁剪圆形
- (UIImage *)circleImage;

// 裁剪指定圆角
- (UIImage *)imageWithCornerRadius:(CGFloat)radius width:(CGFloat)width;
/**
 *  return 旋转后的图片
 *  @param image              原始图片    （必传，不可空）
 *  @param orientation        旋转方向    （必传，不可空）
 */
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;
@end
