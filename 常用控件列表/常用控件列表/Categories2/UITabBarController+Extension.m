//
//  UITabBarController+Extension.m
//  ZXHT
//
//  Created by peng on 2017/8/29.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import "UITabBarController+Extension.h"

@implementation UITabBarController (Extension)

- (void)setLastSelectedIndex:(NSInteger)lastSelectedIndex
{
    objc_setAssociatedObject(self, "lastSelectedIndex", @(lastSelectedIndex), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)lastSelectedIndex
{
    NSNumber *num = objc_getAssociatedObject(self, "lastSelectedIndex");
    return num.integerValue;
}

@end
