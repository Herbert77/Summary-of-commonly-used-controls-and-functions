//
//  HHSwitchButton.h
//  DropDownListView
//
//  Created by Herbert Hu on 2018/7/16.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+ImageTitleSpacing.h"

typedef NS_ENUM(NSUInteger, HHSwitchButtonType) {
    HHSwitchButtonTypeJustTitle,
    HHSwitchButtonTypeTopImage,
    HHSwitchButtonTypeLeftImage,
    HHSwitchButtonTypeBottomImage,
    HHSwitchButtonTypeRightImage
};

typedef void(^OffSelectBlock)(UIButton *btn);
typedef void(^OnSelectBlock)(UIButton *btn);

@interface HHSwitchButton : UIButton

- (instancetype)initWithBounds:(CGRect)theBounds
                    buttonType:(HHSwitchButtonType)type
               imageTitleSpace:(CGFloat)space
                      OffTitle:(NSString *)offTitle
                 offTitleColor:(UIColor *)offTitleColor
                  offImageName:(NSString *)offImageName
                       onTitle:(NSString *)onTitle
                  onTitleColor:(UIColor *)onTitleColor
                   onImageName:(NSString *)onImageName
                offSelectBlock:(OffSelectBlock)offBlock
                 onSelectBlock:(OnSelectBlock)onBlock;

- (void)configWithButtonType:(HHSwitchButtonType)type
             imageTitleSpace:(CGFloat)space
                    OffTitle:(NSString *)offTitle
               offTitleColor:(UIColor *)offTitleColor
                offImageName:(NSString *)offImageName
                     onTitle:(NSString *)onTitle
                onTitleColor:(UIColor *)onTitleColor
                 onImageName:(NSString *)onImageName
              offSelectBlock:(OffSelectBlock)offBlock
               onSelectBlock:(OnSelectBlock)onBlock;

- (void)recoverStatusWithRequestSuccess:(BOOL)reqSuccess;

@end

