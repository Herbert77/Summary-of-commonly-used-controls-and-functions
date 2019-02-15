//
//  UIImage+Extension.m
//  ZXHT
//
//  Created by peng on 2017/4/7.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import "UIImage+Extension.h"
#import <Accelerate/Accelerate.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAssetImageGenerator.h>
#import <AVFoundation/AVAsset.h>

#define ChartletBundle              @"NIMDemoChartlet.bundle"
#define EmojiCatalog                @"default"
#define ChartletChartletCatalogPath @"Chartlet"
#define ChartletChartletCatalogContentPath @"content"
#define ChartletChartletCatalogIconPath    @"icon"
#define ChartletChartletCatalogIconsSuffixNormal    @"normal"
#define ChartletChartletCatalogIconsSuffixHighLight @"highlighted"

@implementation UIImage (Extension)
+ (UIImage *)fetchChartlet:(NSString *)imageName chartletId:(NSString *)chartletId{
    if ([chartletId isEqualToString:EmojiCatalog]) {
        return [UIImage imageNamed:imageName];
    }
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:ChartletBundle ofType:nil];
    
    NSString *subDirectory = [NSString stringWithFormat:@"/%@/%@",chartletId,ChartletChartletCatalogContentPath];
    //先拿2倍图
    NSString *doubleImage  = [imageName stringByAppendingString:@"@2x"];
    NSString *tribleImage  = [imageName stringByAppendingString:@"@3x"];
    NSString *sourcePath   = [bundlePath stringByAppendingPathComponent:subDirectory];
    NSString *path = nil;
    
    NSArray *array = [NSBundle pathsForResourcesOfType:nil inDirectory:sourcePath];
    NSString *fileExt = [[array.firstObject lastPathComponent] pathExtension];
    if ([UIScreen mainScreen].scale == 3.0) {
        path = [NSBundle pathForResource:tribleImage ofType:fileExt inDirectory:sourcePath];
    }
    path = path ? path : [NSBundle pathForResource:doubleImage ofType:fileExt inDirectory:sourcePath]; //取二倍图
    path = path ? path : [NSBundle pathForResource:imageName ofType:fileExt inDirectory:sourcePath]; //实在没了就去取一倍图
    return [UIImage imageWithContentsOfFile:path];
}
+ (UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time
{
    //    AVURLAsset *urlSet = [AVURLAsset assetWithURL:videoURL];
    //    AVAssetImageGenerator *imageGenerator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlSet];
    //    imageGenerator.appliesPreferredTrackTransform = YES;
    //    NSError *error = nil;
    //    CMTime time1 = CMTimeMake(time,10);//缩略图创建时间 CMTime是表示电影时间信息的结构体，第一个参数表示是视频第几秒，第二个参数表示每秒帧数.(如果要活的某一秒的第几帧可以使用CMTimeMake方法)
    //    CMTime actucalTime; //缩略图实际生成的时间
    //    CGImageRef cgImage = [imageGenerator copyCGImageAtTime:time1 actualTime:&actucalTime error:&error];
    //    if (error) {
    //        NSLog(@"截取视频图片失败:%@",error.localizedDescription);
    //    }
    //    CMTimeShow(actucalTime);
    //    UIImage *image = [UIImage imageWithCGImage:cgImage];
    //
    //    CGImageRelease(cgImage);
    //
    //    return image;
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    NSParameterAssert(asset);
    AVAssetImageGenerator *assetImageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = time;
    NSError *thumbnailImageGenerationError = nil;
    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60) actualTime:NULL error:&thumbnailImageGenerationError];
    
    if (!thumbnailImageRef)
        NSLog(@"thumbnailImageGenerationError %@", thumbnailImageGenerationError);
    
    UIImage *thumbnailImage = thumbnailImageRef ? [[UIImage alloc] initWithCGImage:thumbnailImageRef] : nil;
    
    return thumbnailImage;
}

+ (UIImage *)fetchImage:(NSString *)imageNameOrPath{
    UIImage *image = [UIImage imageNamed:imageNameOrPath];
    if (!image) {
        image = [UIImage imageWithContentsOfFile:imageNameOrPath];
    }
    return image;
}


//+ (UIImage *)fetchChartlet:(NSString *)imageName chartletId:(NSString *)chartletId{
//    if ([chartletId isEqualToString:EmojiCatalog]) {
//        return [UIImage imageNamed:imageName];
//    }
//    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:[NIMKit sharedKit].emoticonBundleName ofType:nil];
//    
//    NSString *subDirectory = [NSString stringWithFormat:@"%@/%@/%@",ChartletChartletCatalogPath,chartletId,ChartletChartletCatalogContentPath];
//    //先拿2倍图
//    NSString *doubleImage  = [imageName stringByAppendingString:@"@2x"];
//    NSString *tribleImage  = [imageName stringByAppendingString:@"@3x"];
//    NSString *sourcePath   = [bundlePath stringByAppendingPathComponent:subDirectory];
//    NSString *path = nil;
//    
//    NSArray *array = [NSBundle pathsForResourcesOfType:nil inDirectory:sourcePath];
//    NSString *fileExt = [[array.firstObject lastPathComponent] pathExtension];
//    if ([UIScreen mainScreen].scale == 3.0) {
//        path = [NSBundle pathForResource:tribleImage ofType:fileExt inDirectory:sourcePath];
//    }
//    path = path ? path : [NSBundle pathForResource:doubleImage ofType:fileExt inDirectory:sourcePath]; //取二倍图
//    path = path ? path : [NSBundle pathForResource:imageName ofType:fileExt inDirectory:sourcePath]; //实在没了就去取一倍图
//    return [UIImage imageWithContentsOfFile:path];
//}
//
//- (UIImage *)imageForAvatarUpload
//{
//    CGFloat pixels = [[NTESDevice currentDevice] suggestImagePixels];
//    UIImage * image = [self imageForUpload:pixels];
//    return [image fixOrientation];
//}


#pragma mark - Private

- (UIImage *)imageForUpload: (CGFloat)suggestPixels
{
    const CGFloat kMaxPixels = 4000000;
    const CGFloat kMaxRatio  = 3;
    
    CGFloat width = self.size.width;
    CGFloat height= self.size.height;
    
    //对于超过建议像素，且长宽比超过max ratio的图做特殊处理
    if (width * height > suggestPixels &&
        (width / height > kMaxRatio || height / width > kMaxRatio))
    {
        return [self scaleWithMaxPixels:kMaxPixels];
    }
    else
    {
        return [self scaleWithMaxPixels:suggestPixels];
    }
}

- (UIImage *)scaleWithMaxPixels: (CGFloat)maxPixels
{
    CGFloat width = self.size.width;
    CGFloat height= self.size.height;
    if (width * height < maxPixels || maxPixels == 0)
    {
        return self;
    }
    CGFloat ratio = sqrt(width * height / maxPixels);
    if (fabs(ratio - 1) <= 0.01)
    {
        return self;
    }
    CGFloat newSizeWidth = width / ratio;
    CGFloat newSizeHeight= height/ ratio;
    return [self scaleToSize:CGSizeMake(newSizeWidth, newSizeHeight)];
}

//内缩放，一条变等于最长边，另外一条小于等于最长边
- (UIImage *)scaleToSize:(CGSize)newSize
{
    CGFloat width = self.size.width;
    CGFloat height= self.size.height;
    CGFloat newSizeWidth = newSize.width;
    CGFloat newSizeHeight= newSize.height;
    if (width <= newSizeWidth &&
        height <= newSizeHeight)
    {
        return self;
    }
    
    if (width == 0 || height == 0 || newSizeHeight == 0 || newSizeWidth == 0)
    {
        return nil;
    }
    CGSize size;
    if (width / height > newSizeWidth / newSizeHeight)
    {
        size = CGSizeMake(newSizeWidth, newSizeWidth * height / width);
    }
    else
    {
        size = CGSizeMake(newSizeHeight * width / height, newSizeHeight);
    }
    return [self drawImageWithSize:size];
}

- (UIImage *)drawImageWithSize: (CGSize)size
{
    CGSize drawSize = CGSizeMake(floor(size.width), floor(size.height));
    UIGraphicsBeginImageContext(drawSize);
    
    [self drawInRect:CGRectMake(0, 0, drawSize.width, drawSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)fixOrientation
{
    
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp)
        return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

+ (UIImage *)TwoDBarcodeImageWith:(NSData *)data size:(CGFloat)widthAndHeight
{
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setDefaults];
    
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *outputImage = [filter outputImage];
    
    return [self createNonInterpolatedUIImageFormCIImage:outputImage size:widthAndHeight];
    
}

+ (UIImage *)createImgQRCodeWithString:(NSString *)QRString size:(CGFloat)widthAndHeight centerImage:(UIImage *)centerImage {
    // 创建滤镜对象
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 恢复滤镜的默认属性
    [filter setDefaults];
    
    // 将字符串转换成 NSdata
    NSData *dataString = [QRString dataUsingEncoding:NSUTF8StringEncoding];
    
    // 设置过滤器的输入值, KVC赋值
    [filter setValue:dataString forKey:@"inputMessage"];
    
    // 获得滤镜输出的图像
    CIImage *outImage = [filter outputImage];
    
    // 图片小于(27,27),我们需要放大
    outImage = [outImage imageByApplyingTransform:CGAffineTransformMakeScale(widthAndHeight * 0.1, widthAndHeight * 0.1)];
    
    // 将CIImage类型转成UIImage类型
    UIImage *startImage = [UIImage imageWithCIImage:outImage];
    
    // 开启绘图, 获取图形上下文
    UIGraphicsBeginImageContext(startImage.size);
    
    
    
    // 把二维码图片画上去 (这里是以图形上下文, 左上角为(0,0)点
    [startImage drawInRect:CGRectMake(0, 0, startImage.size.width, startImage.size.height)];
    
    // 再把小图片画上去
    CGFloat icon_imageW = widthAndHeight;
    CGFloat icon_imageH = icon_imageW;
    CGFloat icon_imageX = (startImage.size.width - icon_imageW) * 0.5;
    CGFloat icon_imageY = (startImage.size.height - icon_imageH) * 0.5;
    [centerImage drawInRect:CGRectMake(icon_imageX, icon_imageY, icon_imageW, icon_imageH)];

    // 获取当前画得的这张图片
    UIImage *qrImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    //返回二维码图像
    return qrImage;
}

+ (UIImage *)imageWithImageSize:(CGFloat)size withCIIImage:(CIImage *)ciiImage {
    CGRect extent = CGRectIntegral(ciiImage.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:ciiImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    
    CGContextRelease(bitmapRef);
    
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
    
}

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)ciImage size:(CGFloat)widthAndHeight
{
    CGRect extentRect = CGRectIntegral(ciImage.extent);
    CGFloat scale = MIN(widthAndHeight / CGRectGetWidth(extentRect), widthAndHeight / CGRectGetHeight(extentRect));
    
    size_t width = CGRectGetWidth(extentRect) * scale;
    size_t height = CGRectGetHeight(extentRect) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef bitmapImage = [context createCGImage:ciImage fromRect:extentRect];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extentRect, bitmapImage);
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
}

+ (instancetype)captureWithView:(UIView *)view
{
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    // 2.将控制器view的layer渲染到上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}


+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color havingSize:CGSizeMake(1.0f, 1.0f)];
}

+ (UIImage *)imageWithColor:(UIColor *)color havingSize:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)gradientImageWithSize:(CGSize)size
                        startColor:(UIColor *)startColor
                          endColor:(UIColor *)endColor
                        startPoint:(CGPoint)startPoint
                          endPoint:(CGPoint)endPoint {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    
    //绘制Path
    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect));
    CGPathCloseSubpath(path);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};
    
    NSArray *colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    
    //CGRect pathRect = CGPathGetBoundingBox(path);
    
    //具体方向可根据需求修改
    CGPoint start = CGPointMake(startPoint.x*size.width, startPoint.y*size.height);
    CGPoint end = CGPointMake(endPoint.x*size.width, endPoint.y*size.height);
    
    CGContextSaveGState(gc);
    CGContextAddPath(gc, path);
    CGContextClip(gc);
    CGContextDrawLinearGradient(gc, gradient, start, end, 0);
    CGContextRestoreGState(gc);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    //注意释放CGMutablePathRef
    CGPathRelease(path);
    
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return img;
}

- (instancetype)circleImage {
    UIGraphicsBeginImageContext(self.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect); CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
