//
//  HHSwitchButton.m
//  DropDownListView
//
//  Created by Herbert Hu on 2018/7/16.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "HHSwitchButton.h"

@interface HHSwitchButton ()
@property (copy, nonatomic) OffSelectBlock offSelectBlock;
@property (copy, nonatomic) OnSelectBlock  onSelectBlock;
@end

@implementation HHSwitchButton

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithBounds:(CGRect)theBounds buttonType:(HHSwitchButtonType)type imageTitleSpace:(CGFloat)space OffTitle:(NSString *)offTitle offTitleColor:(UIColor *)offTitleColor offImageName:(NSString *)offImageName onTitle:(NSString *)onTitle onTitleColor:(UIColor *)onTitleColor onImageName:(NSString *)onImageName offSelectBlock:(OffSelectBlock)offBlock onSelectBlock:(OnSelectBlock)onBlock {
    
    self = [HHSwitchButton new];
    if (self) {
        
        [self setBounds:theBounds];
        
        if (offTitle && onTitle) {
            [self setTitle:offTitle forState:UIControlStateNormal];
            [self setTitle:onTitle forState:UIControlStateSelected];
        }
        
        if (offTitleColor) {
            [self setTitleColor:offTitleColor forState:UIControlStateNormal];
        }
        
        if (onTitleColor) {
            [self setTitleColor:onTitleColor forState:UIControlStateSelected];
        }
        
        if (offImageName && onImageName) {
            [self setImage:[UIImage imageNamed:offImageName] forState:UIControlStateNormal];
            [self setImage:[UIImage imageNamed:onImageName] forState:UIControlStateSelected];
        }
        
        MKButtonEdgeInsetsStyle insetStyle;
        if (type == HHSwitchButtonTypeTopImage) {
            insetStyle = MKButtonEdgeInsetsStyleTop;
        }
        else if (type == HHSwitchButtonTypeLeftImage) {
            insetStyle = MKButtonEdgeInsetsStyleLeft;
        }
        else if (type == HHSwitchButtonTypeBottomImage) {
            insetStyle = MKButtonEdgeInsetsStyleBottom;
        }
        else if (type == HHSwitchButtonTypeRightImage) {
            insetStyle = MKButtonEdgeInsetsStyleRight;
        }
        else {
            insetStyle = 99;
        }
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
        if (insetStyle != 99) {
            [self layoutButtonWithEdgeInsetsStyle:insetStyle imageTitleSpace:space];
        }
#pragma clang diagnostic pop
        
        [self addTarget:self action:@selector(btnTap:) forControlEvents:UIControlEventTouchUpInside];
        
        self.offSelectBlock = offBlock;
        self.onSelectBlock = onBlock;
    }
    return self;
}

- (void)configWithButtonType:(HHSwitchButtonType)type imageTitleSpace:(CGFloat)space OffTitle:(NSString *)offTitle offTitleColor:(UIColor *)offTitleColor offImageName:(NSString *)offImageName onTitle:(NSString *)onTitle onTitleColor:(UIColor *)onTitleColor onImageName:(NSString *)onImageName offSelectBlock:(OffSelectBlock)offBlock onSelectBlock:(OnSelectBlock)onBlock {
    
    if (offTitle && onTitle) {
        [self setTitle:offTitle forState:UIControlStateNormal];
        [self setTitle:onTitle forState:UIControlStateSelected];
    }
    
    if (offTitleColor) {
        [self setTitleColor:offTitleColor forState:UIControlStateNormal];
    }
    
    if (onTitleColor) {
        [self setTitleColor:onTitleColor forState:UIControlStateSelected];
    }
    
    if (offImageName && onImageName) {
        [self setImage:[UIImage imageNamed:offImageName] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:onImageName] forState:UIControlStateSelected];
    }
    
    MKButtonEdgeInsetsStyle insetStyle;
    if (type == HHSwitchButtonTypeTopImage) {
        insetStyle = MKButtonEdgeInsetsStyleTop;
    }
    else if (type == HHSwitchButtonTypeLeftImage) {
        insetStyle = MKButtonEdgeInsetsStyleLeft;
    }
    else if (type == HHSwitchButtonTypeBottomImage) {
        insetStyle = MKButtonEdgeInsetsStyleBottom;
    }
    else if (type == HHSwitchButtonTypeRightImage) {
        insetStyle = MKButtonEdgeInsetsStyleRight;
    }
    else {
        insetStyle = 99;
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
    if (insetStyle != 99) {
        [self layoutButtonWithEdgeInsetsStyle:insetStyle imageTitleSpace:space];
    }
#pragma clang diagnostic pop
    
    [self addTarget:self action:@selector(btnTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.offSelectBlock = offBlock;
    self.onSelectBlock = onBlock;
}

- (void)btnTap:(HHSwitchButton *)btn {
    btn.selected = !btn.selected;
    
    [btn setUserInteractionEnabled:NO];
    if (btn.selected == YES) {
        self.offSelectBlock(self);
    }
    else {
        self.onSelectBlock(self);
    }
}

- (void)recoverStatusWithRequestSuccess:(BOOL)reqSuccess {    
    [self setUserInteractionEnabled:YES];
    if (!reqSuccess) {
        self.selected = !self.selected;
    }
}

@end
