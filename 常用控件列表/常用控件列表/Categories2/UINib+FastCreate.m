//
//  UINib+FastCreate.m
//  SmartCity
//
//  Created by ZCGC on 2017/5/16.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import "UINib+FastCreate.h"

@implementation UINib (FastCreate)

+ (instancetype)nibInMainBundle:(NSString *)nibName {
    return [UINib nibWithNibName:nibName bundle:nil];
}

@end

@implementation UIView (NibFastCreate)
+ (UINib *)nibInMainBundle {
    return [self nibInMainBundleWithName:NSStringFromClass(self)];
}
+ (UINib *)nibInMainBundleWithName:(NSString *)nibName {
    return [UINib nibWithNibName:nibName bundle:nil];
}
@end

@implementation UIViewController (NibFastCreate)
+ (UINib *)nibInMainBundle {
    return [self nibInMainBundleWithName:NSStringFromClass(self)];
}
+ (UINib *)nibInMainBundleWithName:(NSString *)nibName {
    return [UINib nibWithNibName:nibName bundle:nil];
}
@end
