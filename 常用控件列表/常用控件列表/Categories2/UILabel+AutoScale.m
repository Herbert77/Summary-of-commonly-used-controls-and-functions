//
//  UILabel+AutoScale.m
//  SmartCity
//
//  Created by ZCGC on 2017/8/22.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import "UILabel+AutoScale.h"

@implementation UILabel (AutoScale)

+ (void)load{
    NSArray *originalSelectors = @[@"setFont:"];
    
    for (NSString *selectorName in originalSelectors) {
        SEL originalSelector = NSSelectorFromString(selectorName);
        SEL swizzledSelector = NSSelectorFromString([@"sp_" stringByAppendingString:selectorName]);
        
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(self,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(self,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
            
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
}

- (void)sp_setFont:(UIFont *)font {
    
    if (self.autoScaleFont) {
        font = [font fontWithSize:homeScale(font.pointSize)];
    }
    return [self sp_setFont:font];
}

- (void)setAutoScaleFont:(BOOL)autoScaleFont {
    if (autoScaleFont == self.autoScaleFont)
        return;
    
    objc_setAssociatedObject(self, "autoScaleFont", @(autoScaleFont), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (autoScaleFont) {
        return [self sp_setFont:[self.font fontWithSize:homeScale(self.font.pointSize)]];
    }else{
        return [self sp_setFont:[self.font fontWithSize:(self.font.pointSize / ([UIScreen mainScreen].bounds.size.width / 375.))]];
    }
}

- (BOOL)autoScaleFont {
    return [objc_getAssociatedObject(self, "autoScaleFont") boolValue];
}


@end
