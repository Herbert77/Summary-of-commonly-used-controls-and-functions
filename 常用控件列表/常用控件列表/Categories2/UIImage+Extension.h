//
//  UIImage+Extension.h
//  ZXHT
//
//  Created by peng on 2017/4/7.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (UIImage *)fetchChartlet:(NSString *)imageName chartletId:(NSString *)chartletId;
/**
 获取视频第一帧
 */
+ (UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;

/**  生成二维码  */
+ (UIImage *)TwoDBarcodeImageWith:(NSData *)data size:(CGFloat)widthAndHeight;

/**  生成带logo的二维码  */
+ (UIImage *)createImgQRCodeWithString:(NSString *)QRString size:(CGFloat)widthAndHeight centerImage:(UIImage *)centerImage;

//+ (UIImage *)fetchImage:(NSString *)imageNameOrPath;

//+ (UIImage *)fetchChartlet:(NSString *)imageName chartletId:(NSString *)chartletId;

//- (UIImage *)imageForAvatarUpload;

- (UIImage *)fixOrientation;

+ (instancetype)captureWithView:(UIView *)view;


+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color havingSize:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 获取渐变色图片

 @param size 图片大小
 @param startColor 起始颜色
 @param endColor 结束颜色
 @param startPoint 起始点（0～1，0～1）
 @param endPoint 结束点（0～1，0～1）
 */
+ (UIImage *)gradientImageWithSize:(CGSize)size
                        startColor:(UIColor *)startColor
                          endColor:(UIColor *)endColor
                        startPoint:(CGPoint)startPoint
                          endPoint:(CGPoint)endPoint;


/**
 *  返回圆形图片
 */
- (instancetype)circleImage;

@end
