//
//  UIView+LayoutConstraints.m
//  UIViewConstraints
//
//  Created by ZCGC on 2015/7/20.
//  Copyright © 2017年 LSP. All rights reserved.
//

#import "UIView+LayoutConstraints.h"
#import <objc/runtime.h>

#define RECOGNIZE_CONSTRAINTS_TO_PROPERTIES 0
@implementation UIView (LayoutConstraints)

- (NSMutableDictionary *)constraintsForOtherViews {
    NSMutableDictionary *dic = objc_getAssociatedObject(self, _cmd);
    if (!dic) {
        dic = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, _cmd, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dic;
}

- (NSString *)storedConstraintsKey {
    NSString *key = objc_getAssociatedObject(self, _cmd);
    if (!key) {
        key = [NSString stringWithFormat:@"%p", self];
        objc_setAssociatedObject(self, _cmd, key, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return key;
}

+ (void)load{
#if !RECOGNIZE_CONSTRAINTS_TO_PROPERTIES
    return;
#endif
    NSArray *originalSelectors = @[@"addConstraint:",
                                   @"removeConstraint:"];
    Class layoutClass = NSClassFromString(@"_UILayoutGuide");
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
        
        if (layoutClass != NULL) { // _UILayoutGuide 这个类需要使用原始的方法。所以再交换一次。
            didAddMethod =
            class_addMethod(layoutClass,
                            originalSelector,
                            method_getImplementation(swizzledMethod),
                            method_getTypeEncoding(swizzledMethod));
            
            if (didAddMethod) {
                class_replaceMethod(layoutClass,
                                    swizzledSelector,
                                    method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod));
                
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    }
}

#if RECOGNIZE_CONSTRAINTS_TO_PROPERTIES
- (void)sp_addConstraint:(NSLayoutConstraint *)constraint  {
    if (self.recognizeConstraintToPropeties) {        
        @try {
            [self matchingPropertryForConstraint:constraint];
        } @catch (NSException *exception) {
#if DEBUG
            NSLog(@"%@", exception);
#endif
        } 
    }
    return [self sp_addConstraint:constraint];
}
#else
- (void)sp_addConstraint:(NSLayoutConstraint *)constraint  {
    return [self addConstraint:constraint];
}
#endif

- (void)matchingPropertryForConstraint:(NSLayoutConstraint *)constraint {
    
    if (constraint.firstAttribute == NSLayoutAttributeHeight) {
        if (constraint.firstItem != self ||
            constraint.secondItem != nil)
            return;
        self.heightConstraint = constraint;
    }else if (constraint.firstAttribute == NSLayoutAttributeWidth) {
        if (constraint.firstItem != self ||
            constraint.secondItem != nil)
            return;
        self.widthConstraint = constraint;
    }else {
        do {
            UIView *owner = nil;
            NSLayoutAttribute ownerAttribute = 0;
            Class layoutClass = NSClassFromString(@"_UILayoutGuide"); // UIViewController利用LayoutGuide布局
            if (constraint.firstItem == self || [constraint.firstItem isKindOfClass:layoutClass]) { // 本视图与子视图
                owner = constraint.secondItem;
                ownerAttribute = constraint.secondAttribute;
            }else if (constraint.secondItem == self || [constraint.secondItem isKindOfClass:layoutClass]) { // 子视图与本视图
                owner = constraint.firstItem;
                ownerAttribute = constraint.firstAttribute;
            }else{// 约束的两个对象不是本视图
                if ([self.subviews containsObject:constraint.firstItem] &&
                    [self.subviews containsObject:constraint.secondItem]) { // 两个对象是本视图的子视图
                    
                    if (constraint.firstAttribute == constraint.secondAttribute) {                     
                        if (constraint.firstAttribute == NSLayoutAttributeLeading || constraint.firstAttribute == NSLayoutAttributeLeft) {
                            [constraint.firstItem constraintsDicForView:constraint.secondItem][@"leading"] =
                            [constraint.secondItem constraintsDicForView:constraint.firstItem][@"leading"] = constraint;
                        }else if (constraint.firstAttribute == NSLayoutAttributeTrailing || constraint.firstAttribute == NSLayoutAttributeRight) {
                            [constraint.firstItem constraintsDicForView:constraint.secondItem][@"trailing"] =
                            [constraint.secondItem constraintsDicForView:constraint.firstItem][@"trailing"] = constraint;
                        }else if (constraint.firstAttribute == NSLayoutAttributeTop) {
                            [constraint.firstItem constraintsDicForView:constraint.secondItem][@"top"] =
                            [constraint.secondItem constraintsDicForView:constraint.firstItem][@"top"] = constraint;
                        }else if (constraint.firstAttribute == NSLayoutAttributeBottom) {
                            [constraint.firstItem constraintsDicForView:constraint.secondItem][@"bottom"] =
                            [constraint.secondItem constraintsDicForView:constraint.firstItem][@"bottom"] = constraint;
                        }
                    }else{
                        if (constraint.firstAttribute == NSLayoutAttributeLeading && constraint.secondAttribute == NSLayoutAttributeTrailing) {
                            [constraint.firstItem constraintsDicForView:constraint.secondItem][@"left_spacing"] =
                            [constraint.secondItem constraintsDicForView:constraint.firstItem][@"right_spacing"] = constraint;
                        }else if (constraint.firstAttribute == NSLayoutAttributeTrailing && constraint.secondAttribute == NSLayoutAttributeLeading) {
                            [constraint.firstItem constraintsDicForView:constraint.secondItem][@"right_spacing"] =
                            [constraint.secondItem constraintsDicForView:constraint.firstItem][@"left_spacing"] = constraint;
                        }else if (constraint.firstAttribute == NSLayoutAttributeTop && constraint.secondAttribute == NSLayoutAttributeBottom) {
                            [constraint.firstItem constraintsDicForView:constraint.secondItem][@"top_spacing"] =
                            [constraint.secondItem constraintsDicForView:constraint.firstItem][@"bottom_spacing"] = constraint;
                        }else if (constraint.firstAttribute == NSLayoutAttributeBottom && constraint.secondAttribute == NSLayoutAttributeTop) {
                            [constraint.firstItem constraintsDicForView:constraint.secondItem][@"bottom_spacing"] =
                            [constraint.secondItem constraintsDicForView:constraint.firstItem][@"top_spacing"] = constraint;
                        }else{
//                            NSLog(@"Has unknow problem!");
                        }
                    }
                }
                break;
            } // 约束的两个对象不是本视图
            if (owner == self)
                break;

            if ([self.subviews containsObject:owner]) {
                switch (ownerAttribute) {
                    case NSLayoutAttributeTop:
                    case NSLayoutAttributeTopMargin:
                        [owner setTopConstraint:constraint];
                        break;
                    case NSLayoutAttributeLeading:
                    case NSLayoutAttributeLeadingMargin:
                        [owner setLeftConstraint:constraint];
                        break;
                    case NSLayoutAttributeTrailing:
                    case NSLayoutAttributeTrailingMargin:
                        [owner setRightConstraint:constraint];
                        break;
                    case NSLayoutAttributeBottom:
                    case NSLayoutAttributeBottomMargin:
                        [owner setBottomConstraint:constraint];
                        break;
                    default:
//                        NSLog(@"Has unresolve problem!");
                        break;
                }
            }else{
//                NSLog(@"Not a problem!");
            }   
        } while (NO);
    }
}

- (NSLayoutConstraint *)leadingEqualToView:(UIView *)view {
    NSMutableDictionary *dic = [self constraintsDicForView:view];
    NSLayoutConstraint *constraint = dic[@"leading"];
    if (!constraint) {
        if (self.translatesAutoresizingMaskIntoConstraints) {
            self.translatesAutoresizingMaskIntoConstraints = NO;
        }
        constraint = [NSLayoutConstraint constraintWithItem:self
                                                  attribute:(NSLayoutAttributeLeading)
                                                  relatedBy:(NSLayoutRelationEqual)
                                                     toItem:view
                                                  attribute:(NSLayoutAttributeLeading)
                                                 multiplier:1 constant:0];
        [self.superview sp_addConstraint:constraint];
        [view constraintsDicForView:self][@"leading"] =
        dic[@"leading"] = constraint;
    }
    return constraint;
}
- (NSLayoutConstraint *)trailingEqualToView:(UIView *)view {
    NSMutableDictionary *dic = [self constraintsDicForView:view];
    NSLayoutConstraint *constraint = dic[@"trailing"];
    if (!constraint) {
        if (self.translatesAutoresizingMaskIntoConstraints) {
            self.translatesAutoresizingMaskIntoConstraints = NO;
        }
        constraint = [NSLayoutConstraint constraintWithItem:view
                                                  attribute:(NSLayoutAttributeTrailing)
                                                  relatedBy:(NSLayoutRelationEqual)
                                                     toItem:self
                                                  attribute:(NSLayoutAttributeTrailing)
                                                 multiplier:1 constant:0];
        [self.superview sp_addConstraint:constraint];
        [view constraintsDicForView:self][@"trailing"] =
        dic[@"trailing"] = constraint;
    }
    return constraint;
}
- (NSLayoutConstraint *)topEqualToView:(UIView *)view {
    NSMutableDictionary *dic = [self constraintsDicForView:view];
    NSLayoutConstraint *constraint = dic[@"top"];
    if (!constraint) {
        if (self.translatesAutoresizingMaskIntoConstraints) {
            self.translatesAutoresizingMaskIntoConstraints = NO;
        }
        constraint = [NSLayoutConstraint constraintWithItem:self
                                                  attribute:(NSLayoutAttributeTop)
                                                  relatedBy:(NSLayoutRelationEqual)
                                                     toItem:view
                                                  attribute:(NSLayoutAttributeTop)
                                                 multiplier:1 constant:0];
        [self.superview sp_addConstraint:constraint];
        [view constraintsDicForView:self][@"top"] =
        dic[@"top"] = constraint;
    }
    return constraint;
}
- (NSLayoutConstraint *)bottomEqualToView:(UIView *)view {
    NSMutableDictionary *dic = [self constraintsDicForView:view];
    NSLayoutConstraint *constraint = dic[@"bottom"];
    if (!constraint) {
        if (self.translatesAutoresizingMaskIntoConstraints) {
            self.translatesAutoresizingMaskIntoConstraints = NO;
        }
        constraint = [NSLayoutConstraint constraintWithItem:view
                                                  attribute:(NSLayoutAttributeBottom)
                                                  relatedBy:(NSLayoutRelationEqual)
                                                     toItem:self
                                                  attribute:(NSLayoutAttributeBottom)
                                                 multiplier:1 constant:0];
        [self.superview sp_addConstraint:constraint];
        [view constraintsDicForView:self][@"bottom"] =
        dic[@"bottom"] = constraint;
    }
    return constraint;
}

- (NSLayoutConstraint *)leadingSpacingToView:(UIView *)view {
    NSMutableDictionary *dic = [self constraintsDicForView:view];
    NSLayoutConstraint *constraint = dic[@"left_spacing"];
    if (!constraint) {
        if (self.translatesAutoresizingMaskIntoConstraints) {
            self.translatesAutoresizingMaskIntoConstraints = NO;
        }
        constraint = [NSLayoutConstraint constraintWithItem:self
                                                  attribute:(NSLayoutAttributeLeading)
                                                  relatedBy:(NSLayoutRelationEqual)
                                                     toItem:view
                                                  attribute:(NSLayoutAttributeTrailing)
                                                 multiplier:1 constant:0];
        [self.superview sp_addConstraint:constraint];
        [view constraintsDicForView:self][@"left_spacing"] =
        dic[@"left_spacing"] = constraint;
    }
    return constraint;
}
- (NSLayoutConstraint *)trailingSpacingToView:(UIView *)view {
    NSMutableDictionary *dic = [self constraintsDicForView:view];
    NSLayoutConstraint *constraint = dic[@"right_spacing"];
    if (!constraint) {
        if (self.translatesAutoresizingMaskIntoConstraints) {
            self.translatesAutoresizingMaskIntoConstraints = NO;
        }
        constraint = [NSLayoutConstraint constraintWithItem:view
                                                  attribute:(NSLayoutAttributeLeading)
                                                  relatedBy:(NSLayoutRelationEqual)
                                                     toItem:self
                                                  attribute:(NSLayoutAttributeTrailing)
                                                 multiplier:1 constant:0];
        [self.superview sp_addConstraint:constraint];
        [view constraintsDicForView:self][@"right_spacing"] =
        dic[@"right_spacing"] = constraint;
    }
    return constraint;
}
- (NSLayoutConstraint *)topSpacingToView:(UIView *)view {
    NSMutableDictionary *dic = [self constraintsDicForView:view];
    NSLayoutConstraint *constraint = dic[@"top_spacing"];
    if (!constraint) {
        if (self.translatesAutoresizingMaskIntoConstraints) {
            self.translatesAutoresizingMaskIntoConstraints = NO;
        }
        constraint = [NSLayoutConstraint constraintWithItem:self
                                                  attribute:(NSLayoutAttributeTop)
                                                  relatedBy:(NSLayoutRelationEqual)
                                                     toItem:view
                                                  attribute:(NSLayoutAttributeBottom)
                                                 multiplier:1 constant:0];
        [self.superview sp_addConstraint:constraint];
        [view constraintsDicForView:self][@"top_spacing"] =
        dic[@"top_spacing"] = constraint;
    }
    return constraint;
}
- (NSLayoutConstraint *)bottomSpacingToView:(UIView *)view {
    NSMutableDictionary *dic = [self constraintsDicForView:view];
    NSLayoutConstraint *constraint = dic[@"bottom_spacing"];
    if (!constraint) {
        if (self.translatesAutoresizingMaskIntoConstraints) {
            self.translatesAutoresizingMaskIntoConstraints = NO;
        }
        constraint = [NSLayoutConstraint constraintWithItem:view
                                                  attribute:(NSLayoutAttributeTop)
                                                  relatedBy:(NSLayoutRelationEqual)
                                                     toItem:self
                                                  attribute:(NSLayoutAttributeBottom)
                                                 multiplier:1 constant:0];
        [self.superview sp_addConstraint:constraint];
        [view constraintsDicForView:self][@"bottom_spacing"] =
        dic[@"bottom_spacing"] = constraint;
    }
    return constraint;
}

- (NSMutableDictionary *)constraintsDicForView:(UIView *)view {
    NSMutableDictionary *dic = self.constraintsForOtherViews[view.storedConstraintsKey];
    if (!dic) {
        self.constraintsForOtherViews[view.storedConstraintsKey] =
        dic = [NSMutableDictionary dictionaryWithCapacity:8];
    }
    return dic;
}

#if RECOGNIZE_CONSTRAINTS_TO_PROPERTIES
- (void)sp_removeConstraint:(NSLayoutConstraint *)constraint {
    if (self.recognizeConstraintToPropeties) {
        @try {
            [self removeMatchedPropertiesForConstraint:constraint];
        } @catch (NSException *exception) {
#if DEBUG
            NSLog(@"%@", exception);
#endif
        }        
    }
    return [self sp_removeConstraint:constraint];
}
#else
- (void)sp_removeConstraint:(NSLayoutConstraint *)constraint {
    return [self removeConstraint:constraint];
}
#endif

- (void)removeMatchedPropertiesForConstraint:(NSLayoutConstraint *)constraint {
        // Remove from property.
    if (constraint.firstAttribute == NSLayoutAttributeHeight) {
        if (constraint.firstItem != self ||
            constraint.secondItem != nil)
            return;
        self.heightConstraint = nil;
    }else if (constraint.firstAttribute == NSLayoutAttributeWidth) {
        if (constraint.firstItem != self ||
            constraint.secondItem != nil)
            return;
        self.widthConstraint = nil;
    }else {
        do {            
            UIView *owner = nil;
            NSLayoutAttribute ownerAttribute = 0;
            Class layoutClass = NSClassFromString(@"_UILayoutGuide"); // UIViewController利用LayoutGuide布局
            if (constraint.firstItem == self || [constraint.firstItem isKindOfClass:layoutClass]) { // 本视图与子视图
                owner = constraint.secondItem;
                ownerAttribute = constraint.secondAttribute;
            }else if (constraint.secondItem == self || [constraint.secondItem isKindOfClass:layoutClass]) { // 子视图与本视图
                owner = constraint.firstItem;
                ownerAttribute = constraint.firstAttribute;
            }else{// 约束的两个对象不是本视图
                if ([self.subviews containsObject:constraint.firstItem] &&
                    [self.subviews containsObject:constraint.secondItem]) { // 两个对象是本视图的子视图
                    
                    if (constraint.firstAttribute == constraint.secondAttribute) { // 两个属性相同
                        if (constraint.firstAttribute == NSLayoutAttributeLeading || constraint.firstAttribute == NSLayoutAttributeLeft) {
                            [constraint.firstItem constraintsForOtherViews][[constraint.secondItem storedConstraintsKey]][@"leading"] =
                            [constraint.secondItem constraintsForOtherViews][[constraint.firstItem storedConstraintsKey]][@"leading"] = nil;
                        }else if (constraint.firstAttribute == NSLayoutAttributeTrailing || constraint.firstAttribute == NSLayoutAttributeRight) {
                            [constraint.firstItem constraintsForOtherViews][[constraint.secondItem storedConstraintsKey]][@"trailing"] =
                            [constraint.secondItem constraintsForOtherViews][[constraint.firstItem storedConstraintsKey]][@"trailing"] = nil;
                        }else if (constraint.firstAttribute == NSLayoutAttributeTop) {
                            [constraint.firstItem constraintsForOtherViews][[constraint.secondItem storedConstraintsKey]][@"top"] =
                            [constraint.secondItem constraintsForOtherViews][[constraint.firstItem storedConstraintsKey]][@"top"] = nil;
                        }else if (constraint.firstAttribute == NSLayoutAttributeBottom) {
                            [constraint.firstItem constraintsForOtherViews][[constraint.secondItem storedConstraintsKey]][@"bottom"] =
                            [constraint.secondItem constraintsForOtherViews][[constraint.firstItem storedConstraintsKey]][@"bottom"] = nil;
                        }
                    }else{ // 两个属性不相同
                        if (constraint.firstAttribute == NSLayoutAttributeLeading && constraint.secondAttribute == NSLayoutAttributeTrailing) {
                            [constraint.firstItem constraintsForOtherViews][[constraint.secondItem storedConstraintsKey]][@"left_spacing"] =
                            [constraint.secondItem constraintsForOtherViews][[constraint.firstItem storedConstraintsKey]][@"right_spacing"] = nil;
                        }else if (constraint.firstAttribute == NSLayoutAttributeTrailing && constraint.secondAttribute == NSLayoutAttributeLeading) {
                            [constraint.firstItem constraintsForOtherViews][[constraint.secondItem storedConstraintsKey]][@"right_spacing"] =
                            [constraint.secondItem constraintsForOtherViews][[constraint.firstItem storedConstraintsKey]][@"left_spacing"] = nil;
                        }else if (constraint.firstAttribute == NSLayoutAttributeTop && constraint.secondAttribute == NSLayoutAttributeBottom) {
                            [constraint.firstItem constraintsForOtherViews][[constraint.secondItem storedConstraintsKey]][@"top_spacing"] =
                            [constraint.secondItem constraintsForOtherViews][[constraint.firstItem storedConstraintsKey]][@"bottom_spacing"] = nil;
                        }else if (constraint.firstAttribute == NSLayoutAttributeBottom && constraint.secondAttribute == NSLayoutAttributeTop) {
                            [constraint.firstItem constraintsForOtherViews][[constraint.secondItem storedConstraintsKey]][@"bottom_spacing"] =
                            [constraint.secondItem constraintsForOtherViews][[constraint.firstItem storedConstraintsKey]][@"top_spacing"] = nil;
                        }else{
//                            NSLog(@"Has unknow problem!");
                        }
                    } // 两个属性不相同
                } // 两个对象是本视图的子视图
                break;
            }
            if (owner == self)
                break;
            if ([self.subviews containsObject:owner]) {
                switch (ownerAttribute) {
                    case NSLayoutAttributeTop:
                    case NSLayoutAttributeTopMargin:
                        [owner setTopConstraint:nil];
                        break;
                    case NSLayoutAttributeLeading:
                    case NSLayoutAttributeLeadingMargin:
                        [owner setLeftConstraint:nil];
                        break;
                    case NSLayoutAttributeTrailing:
                    case NSLayoutAttributeTrailingMargin:
                        [owner setRightConstraint:nil];
                        break;
                    case NSLayoutAttributeBottom:
                    case NSLayoutAttributeBottomMargin:
                        [owner setBottomConstraint:nil];
                        break;
                    default:
//                        NSLog(@"Has unresolve problem!");
                        break;
                }
                
            }else{
//                NSLog(@"Not a problem!");
            }
        } while (NO);
    }
}

/* *********************************************************************************** */
/* ***** Getter ***** Getter ***** Getter ***** Getter ***** Getter ***** Getter ***** */
/* *********************************************************************************** */

- (BOOL)recognizeConstraintToPropeties {
    return objc_getAssociatedObject(self, "recognizeConstraintToPropeties");
}
    // 宽度约束
- (NSLayoutConstraint *)widthConstraint {
#if DEBUG
//    NSParameterAssert(self.superview);
#endif
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, _cmd);
    if (!constraint) {
        constraint = [self makeWidthConstraint:0];
    }
    return constraint;
}

- (NSLayoutConstraint *)makeWidthConstraint:(CGFloat)width {
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:(NSLayoutAttributeWidth)
                                              relatedBy:(NSLayoutRelationEqual)
                                                 toItem:nil
                                              attribute:(NSLayoutAttributeNotAnAttribute)
                                             multiplier:1 constant:width];
    [self sp_addConstraint:constraint];
    self.widthConstraint = constraint;
    return constraint;
}

    // 高度约束
- (NSLayoutConstraint *)heightConstraint {
#if DEBUG
//    NSParameterAssert(self.superview);
#endif
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, _cmd);
    if (!constraint) {
        constraint = [self makeWidthConstraint:0];
    }
    return constraint;
}

- (NSLayoutConstraint *)makeHeightConstraint:(CGFloat)height {
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:(NSLayoutAttributeHeight)
                                                                  relatedBy:(NSLayoutRelationEqual)
                                                                     toItem:nil
                                                                  attribute:(NSLayoutAttributeNotAnAttribute)
                                                                 multiplier:1 constant:height];
    [self sp_addConstraint:constraint];
    self.heightConstraint = constraint;
    return constraint;
}

    // 左边约束
- (NSLayoutConstraint *)leftConstraint {
#if DEBUG
    NSParameterAssert(self.superview);
#endif
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, _cmd);
    if (!constraint) {
        constraint = [self makeLeftConstraint:0];
    }
    return constraint;
}
- (NSLayoutConstraint *)makeLeftConstraint:(CGFloat)left {
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:(NSLayoutAttributeLeading)
                                                                  relatedBy:(NSLayoutRelationEqual)
                                                                     toItem:self.superview
                                                                  attribute:(NSLayoutAttributeLeading)
                                                                 multiplier:1 constant:left];
    [self.superview sp_addConstraint:constraint];
    self.leftConstraint = constraint;
    return constraint;
}

// 顶部约束
- (NSLayoutConstraint *)topConstraint {
#if DEBUG
    NSParameterAssert(self.superview);
#endif
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, _cmd);
    if (!constraint) {
        constraint = [self makeTopConstraint:0];
    }
    return constraint;
}
- (NSLayoutConstraint *)makeTopConstraint:(CGFloat)top {
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:(NSLayoutAttributeTop)
                                              relatedBy:(NSLayoutRelationEqual)
                                                 toItem:self.superview
                                              attribute:(NSLayoutAttributeTop)
                                             multiplier:1 constant:top];
    [self.superview sp_addConstraint:constraint];
    self.topConstraint = constraint;
    return constraint;
}

// 右边约束
- (NSLayoutConstraint *)rightConstraint {
#if DEBUG
    NSParameterAssert(self.superview);
#endif
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, _cmd);
    if (!constraint) {
        constraint = [self makeRightConstraint:0];
    }
    return constraint;
}
- (NSLayoutConstraint *)makeRightConstraint:(CGFloat)right {
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.superview
                                              attribute:(NSLayoutAttributeTrailing)
                                              relatedBy:(NSLayoutRelationEqual)
                                                 toItem:self
                                              attribute:(NSLayoutAttributeTrailing)
                                             multiplier:1 constant:right];
    [self.superview sp_addConstraint:constraint];
    self.rightConstraint = constraint;
    return constraint;
}


// 底部约束
- (NSLayoutConstraint *)bottomConstraint {
#if DEBUG
    NSParameterAssert(self.superview);
#endif
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, _cmd);
    if (!constraint) {
        constraint = [self makeBottomConstraint:0];
    }
    return constraint;
}
- (NSLayoutConstraint *)makeBottomConstraint:(CGFloat)bottom {
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.superview
                                              attribute:(NSLayoutAttributeBottom)
                                              relatedBy:(NSLayoutRelationEqual)
                                                 toItem:self
                                              attribute:(NSLayoutAttributeBottom)
                                             multiplier:1 constant:bottom];
    [self.superview sp_addConstraint:constraint];
    self.bottomConstraint = constraint;
    return constraint;
}

- (NSLayoutConstraint *)centerXConstraint {
#if DEBUG
    NSParameterAssert(self.superview);
#endif
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, _cmd);
    if (!constraint) {
        constraint = [self makeCenterXConstraint:0];
    }
    return constraint;
}
- (NSLayoutConstraint *)makeCenterXConstraint:(CGFloat)centerX {
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.superview
                                              attribute:(NSLayoutAttributeCenterX)
                                              relatedBy:(NSLayoutRelationEqual)
                                                 toItem:self
                                              attribute:(NSLayoutAttributeCenterX)
                                             multiplier:1 constant:centerX];
    [self.superview sp_addConstraint:constraint];
    self.bottomConstraint = constraint;
    return constraint;
}

- (NSLayoutConstraint *)centerYConstraint {
#if DEBUG
    NSParameterAssert(self.superview);
#endif
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, _cmd);
    if (!constraint) {
        constraint = [self makeCenterYConstraint:0];
    }
    return constraint;
}
- (NSLayoutConstraint *)makeCenterYConstraint:(CGFloat)centerY {
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.superview
                                              attribute:(NSLayoutAttributeCenterY)
                                              relatedBy:(NSLayoutRelationEqual)
                                                 toItem:self
                                              attribute:(NSLayoutAttributeCenterY)
                                             multiplier:1 constant:centerY];
    [self.superview sp_addConstraint:constraint];
    self.bottomConstraint = constraint;
    return constraint;
}

/* *********************************************************************************** */
/* ***** Setter ***** Setter ***** Setter ***** Setter ***** Setter ***** Setter ***** */
/* *********************************************************************************** */

- (void)setWidthConstraint:(NSLayoutConstraint *)widthConstraint {
    objc_setAssociatedObject(self, @selector(widthConstraint), widthConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setHeightConstraint:(NSLayoutConstraint *)heightConstraint {
    objc_setAssociatedObject(self, @selector(heightConstraint), heightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setLeftConstraint:(NSLayoutConstraint *)leftConstraint {
    objc_setAssociatedObject(self, @selector(leftConstraint), leftConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setTopConstraint:(NSLayoutConstraint *)topConstraint {
    objc_setAssociatedObject(self, @selector(topConstraint), topConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setRightConstraint:(NSLayoutConstraint *)rightConstraint {
    objc_setAssociatedObject(self, @selector(rightConstraint), rightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setBottomConstraint:(NSLayoutConstraint *)bottomConstraint {
    objc_setAssociatedObject(self, @selector(bottomConstraint), bottomConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setCenterXConstraint:(NSLayoutConstraint *)centerXConstraint {
    objc_setAssociatedObject(self, @selector(centerXConstraint), centerXConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setCenterYConstraint:(NSLayoutConstraint *)centerYConstraint {
    objc_setAssociatedObject(self, @selector(centerYConstraint), centerYConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

    // Easily to get the constant of contraint.
- (CGFloat)widthConstant {
    return self.widthConstraint.constant;
}
- (CGFloat)heightConstant {
    return self.heightConstraint.constant;
}
- (CGFloat)leftConstant {
    return self.leftConstraint.constant;
}
- (CGFloat)topConstant {
    return self.topConstraint.constant;
}
- (CGFloat)rightConstant {
    return self.rightConstraint.constant;
}
- (CGFloat)bottomConstant {
    return self.bottomConstraint.constant;
}
- (CGFloat)centerXConstant {
    return self.centerXConstraint.constant;
}
- (CGFloat)centerYConstant {
    return self.centerYConstraint.constant;
}

    // Easily to set the constant of contraint.
- (void)setWidthConstant:(CGFloat)widthConstant {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(widthConstraint));
    if (!constraint) {
        [self makeWidthConstraint:widthConstant];
    }else{
        self.widthConstraint.constant = widthConstant;
    }
}
- (void)setHeightConstant:(CGFloat)heightConstant {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(heightConstraint));
    if (!constraint) {
        [self makeHeightConstraint:heightConstant];
    }else{
        self.heightConstraint.constant = heightConstant;
    }
}
- (void)setLeftConstant:(CGFloat)leftConstant {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(leftConstraint));
    if (!constraint) {
        [self makeLeftConstraint:leftConstant];
    }else{
        self.leftConstraint.constant = leftConstant;
    }
}
- (void)setTopConstant:(CGFloat)topConstant {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(topConstraint));
    if (!constraint) {
        [self makeTopConstraint:topConstant];
    }else{
        self.topConstraint.constant = topConstant;
    }
}
- (void)setRightConstant:(CGFloat)rightConstant {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(rightConstraint));
    if (!constraint) {
        [self makeRightConstraint:rightConstant];
    }else{
        self.rightConstraint.constant = rightConstant;
    }
}
- (void)setBottomConstant:(CGFloat)bottomConstant {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(bottomConstraint));
    if (!constraint) {
        [self makeBottomConstraint:bottomConstant];
    }else{
        self.bottomConstraint.constant = bottomConstant;
    }
}
- (void)setCenterXConstant:(CGFloat)centerXConstant {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(centerXConstraint));
    if (!constraint) {
        [self makeCenterXConstraint:centerXConstant];
    }else{
        self.centerXConstraint.constant = centerXConstant;
    }
}
- (void)setCenterYConstant:(CGFloat)centerYConstant {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(centerYConstraint));
    if (!constraint) {
        [self makeCenterYConstraint:centerYConstant];
    }else{
        self.centerYConstraint.constant = centerYConstant;
    }
}


- (void)setRecognizeConstraintToPropeties:(BOOL)recognizeConstraintToPropeties {
    if (recognizeConstraintToPropeties == self.recognizeConstraintToPropeties)
        return;
    
    objc_setAssociatedObject(self, "recognizeConstraintToPropeties", recognizeConstraintToPropeties?@1:@0, OBJC_ASSOCIATION_RETAIN_NONATOMIC);    
}

@end
