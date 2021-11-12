//
//  UtilsMacro.h
//  MHM-P_Protocol
//
//  Created by Herbert Hu on 2020/5/28.
//  Copyright © 2020 tecomtech. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

#define Hidden_TIME   3.0

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IS_IPHONE_4         (IS_IPHONE  \
&& ([UIScreen mainScreen].bounds.size.height == 480.0f  \
|| [UIScreen mainScreen].bounds.size.width == 480.f))
#define IS_IPHONE_5         (IS_IPHONE  \
&& ([UIScreen mainScreen].bounds.size.height == 568.0f  \
|| [UIScreen mainScreen].bounds.size.width == 568.0f))
#define IS_IPHONE_6         (IS_IPHONE  \
&& ([UIScreen mainScreen].bounds.size.height == 667.0f  \
|| [UIScreen mainScreen].bounds.size.width == 667.0f))
#define IS_IPHONE_6_PLUS    (IS_IPHONE  \
&& ([UIScreen mainScreen].bounds.size.height == 736.0f  \
|| [UIScreen mainScreen].bounds.size.width == 736.0f))
#define IS_iPhoneX          (IS_IPHONE  \
&& ([UIScreen mainScreen].bounds.size.height == 812.0f  \
|| [UIScreen mainScreen].bounds.size.width == 812.0f))

#define AS_SINGLETON( __class ) \
- (__class *)sharedInstance; \
+ (__class *)sharedInstance;
#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
- (__class *)sharedInstance \
{ \
return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
return __singleton__; \
}

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
/*------------------- 设备大小 -------------------*/

// 导航栏高度
#define NavigationBar_HEIGHT 44

/// 状态栏高度
#define KStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

// 屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

// 屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

/*------------------- 日志打印 -------------------*/

#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

/*------------------- 系统 -------------------*/

// 系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

// 当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

// Retina屏幕 ？
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

// iPhone 5 ?
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/*------------------- 图片 -------------------*/

// 读取本地图片
#define LOADIMAGE(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

/*------------------- 颜色 -------------------*/

// RGB 颜色转换 （16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// Red Green Blue Alpha 颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 系统控件默认高度
#define kStatusBarHeight        (20.f)
#define kTopBarHeight           (44.f)
#define kBottomBarHeight        (49.f)
#define kCellDefaultHeight      (44.f)
#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)

//** 获得当前的 年 月 日 时 分 秒 *****************************************************************************
#define  CurrentSec [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:[NSDate date]]
#define  CurrentMin [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:[NSDate date]]
#define  CurrentHour [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]]
#define  CurrentDay  [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate date]]
#define  CurrentMonth [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate date]]
#define  CurrentYear [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate date]]

//** 沙盒路径 ***********************************************************************************
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// ----------------------------------------设备类型及手机型号------------start-----------------------
//  是否是ipad
#define SC_isIPad   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//  是否是iphone
#define SC_isIPhone   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//  是否是iPhone4
#define SC_iPhone4  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//  是否是iPhone5或iPhone5s
#define SC_iPhone5   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//  iPhone6或iPhone7或iPhone8
#define SC_iPhone678   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

//  iPhone6Plus或iPhone7Plus或iPhone8Plus
#define SC_iPhone678Plus   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhoneX
#define SC_iPhone_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define SC_iPhoneXr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define SC_iPhoneXs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define SC_iPhoneXsMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//  是否是iPhoneX系列     //可以用于快速适配所有机型，包括iPhoneX
#define SC_iPhoneX   (SC_iPhone_X + SC_iPhoneXr + SC_iPhoneXs + SC_iPhoneXsMax)

//  带状态栏的导航栏高度              //可以用于快速适配所有机型，包括iPhoneX
#define MHM_StatusBarAndNavigationBarHeight  (SC_iPhoneX ? 88.f : 64.f)

// ----------------------------------------设备类型及手机型号------------end-----------------------

// 存储
#define MHMUserDefault      [NSUserDefaults standardUserDefaults]

#endif /* UtilsMacro_h */

