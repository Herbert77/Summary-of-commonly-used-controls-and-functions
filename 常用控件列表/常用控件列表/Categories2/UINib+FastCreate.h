//
//  UINib+FastCreate.h
//  SmartCity
//
//  Created by ZCGC on 2017/5/16.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (FastCreate)

/**
 *  从Main Bundle中加载NIB。
 *
 *  @param nibName XIB的文件名
 *  @return 对应的NIB对象
 */
+ (instancetype)nibInMainBundle:(NSString *)nibName;

@end

@interface UIView (NibFastCreate)
+ (UINib *)nibInMainBundle;
+ (UINib *)nibInMainBundleWithName:(NSString *)nibName;
@end

@interface UIViewController (NibFastCreate)
+ (UINib *)nibInMainBundle;
+ (UINib *)nibInMainBundleWithName:(NSString *)nibName;
@end
