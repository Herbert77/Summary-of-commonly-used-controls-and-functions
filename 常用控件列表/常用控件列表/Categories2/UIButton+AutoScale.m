//
//  UIButton+AutoScale.m
//  SmartCity
//
//  Created by LSP on 17/8/24.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import "UIButton+AutoScale.h"
#import "UILabel+AutoScale.h"

@implementation UIButton (AutoScale)

//- (void)sp_setFont:(UIFont *)font {
//    
//    if (self.autoScaleFont) {
//        font = [font fontWithSize:self.font.pointSize * screenWidthScaleBase375()];
//    }
//    return [self sp_setFont:font];
//}

- (void)setAutoScaleFont:(BOOL)autoScaleFont {
    if (autoScaleFont == self.autoScaleFont)
        return;
    
    self.titleLabel.autoScaleFont = autoScaleFont;
}

- (BOOL)autoScaleFont {
    return self.titleLabel.autoScaleFont;
}

@end
