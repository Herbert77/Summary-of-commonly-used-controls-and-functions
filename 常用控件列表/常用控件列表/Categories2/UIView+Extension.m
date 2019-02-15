//
//  UIView+Extension.m
//  ZXHT
//
//  Created by peng on 2017/3/27.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import "UIView+Extension.h"
#import "KSPhotoBrowser.h"

@implementation UIView (Extension)

+ (UILabel *)setupNavTitle:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:17];
    [label sizeToFit];
    return label;
}

//- (UITapGestureRecognizer *)addTapGestureRecognizerWithTarget:(id)target action:(SEL)action
//{
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
//
//    if (!self.isUserInteractionEnabled) {
//        self.userInteractionEnabled = YES;
//    }
//
//    [self addGestureRecognizer:tap];
//    return tap;
//}



/**
 获取指定类型的父控件
 */
- (UIView*)parentViewWithType:(Class)viewType
{
    UIView *parentView = self.superview;
    while ([parentView isKindOfClass:viewType]) {
        return parentView;
    }
    return  parentView==nil?nil:[parentView parentViewWithType:viewType];
}

- (UIViewController *) firstAvailableUIViewController {
    // convenience function for casting and to "mask" the recursive function
    return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (id) traverseResponderChainForUIViewController {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForUIViewController];
    } else {
        return nil;
    }
}


- (UIView*)addTopLineWithColor:(UIColor *)color andHeight:(CGFloat)height
{
    UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.frame),height)];
    topLine.backgroundColor = color;
    topLine.alpha = 1;
    
    topLine.translatesAutoresizingMaskIntoConstraints=NO;
    
    [self addSubview:topLine];
    
    NSLayoutConstraint *topContraint=[NSLayoutConstraint
                                      constraintWithItem:topLine
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self
                                      attribute:NSLayoutAttributeTop
                                      multiplier:1.0f
                                      constant:0.0];
    NSLayoutConstraint *widthContraint=[NSLayoutConstraint
                                        constraintWithItem:topLine
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                        attribute:NSLayoutAttributeWidth
                                        multiplier:1.0f
                                        constant:0.0];
    
    NSLayoutConstraint *heightContraint=[NSLayoutConstraint
                                         constraintWithItem:topLine
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0f
                                         constant:height];
    
    NSLayoutConstraint *leadingContraint=[NSLayoutConstraint
                                          constraintWithItem:topLine
                                          attribute:NSLayoutAttributeLeading
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeLeading
                                          multiplier:1.0f
                                          constant:0.0];
    
    [topLine addConstraint:heightContraint];
    //给button的父节点添加约束
    [self addConstraints:@[topContraint,widthContraint,leadingContraint]];
    
    return topLine;
    
}

- (UIView*)addBottomLineWithColor:(UIColor *)color andHeight:(CGFloat)height
{
    
    UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetHeight(self.frame) - height,CGRectGetWidth(self.frame),height)];
    bottomLine.backgroundColor = color;
    bottomLine.alpha = 1;
    bottomLine.translatesAutoresizingMaskIntoConstraints=NO;
    [self addSubview:bottomLine];
    
    NSLayoutConstraint *bottomContraint=[NSLayoutConstraint
                                         constraintWithItem:bottomLine
                                         attribute:NSLayoutAttributeBottom
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                         attribute:NSLayoutAttributeBottom
                                         multiplier:1.0f
                                         constant:0.0];
    NSLayoutConstraint *widthContraint=[NSLayoutConstraint
                                        constraintWithItem:bottomLine
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                        attribute:NSLayoutAttributeWidth
                                        multiplier:1.0f
                                        constant:0.0];
    
    NSLayoutConstraint *heightContraint=[NSLayoutConstraint
                                         constraintWithItem:bottomLine
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0f
                                         constant:height];
    
    NSLayoutConstraint *leadingContraint=[NSLayoutConstraint
                                          constraintWithItem:bottomLine
                                          attribute:NSLayoutAttributeLeading
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeLeading
                                          multiplier:1.0f
                                          constant:0.0];
    
    
    
    [bottomLine addConstraint:heightContraint];
    //给button的父节点添加约束
    [self addConstraints:@[bottomContraint,widthContraint,leadingContraint]];
    
    
    return bottomLine;
}

- (UIView*)addLeftLineWithColor:(UIColor *)color andWidth:(CGFloat)width {
    UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0,width,CGRectGetHeight(self.frame))];
    leftLine.backgroundColor = color;
    leftLine.alpha = 1;
    
    leftLine.translatesAutoresizingMaskIntoConstraints=NO;
    
    [self addSubview:leftLine];
    
    NSLayoutConstraint *leftContraint = [NSLayoutConstraint
                                      constraintWithItem:leftLine
                                      attribute:NSLayoutAttributeLeft
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self
                                      attribute:NSLayoutAttributeLeft
                                      multiplier:1.0f
                                      constant:0.0];
    
    NSLayoutConstraint *heightContraint = [NSLayoutConstraint
                                        constraintWithItem:leftLine
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                        attribute:NSLayoutAttributeHeight
                                        multiplier:1.0f
                                        constant:0.0];
    
    NSLayoutConstraint *widthContraint = [NSLayoutConstraint
                                         constraintWithItem:leftLine
                                         attribute:NSLayoutAttributeWidth
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0f
                                         constant:width];
    
    NSLayoutConstraint *topContraint = [NSLayoutConstraint
                                          constraintWithItem:leftLine
                                          attribute:NSLayoutAttributeTop
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeTop
                                          multiplier:1.0f
                                          constant:0.0];

    NSLayoutConstraint *bottomContraint = [NSLayoutConstraint
                                      constraintWithItem:leftLine
                                      attribute:NSLayoutAttributeBottom
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self
                                      attribute:NSLayoutAttributeBottom
                                      multiplier:1.0f
                                      constant:0.0];
    
    [leftLine addConstraint:widthContraint];
    //给button的父节点添加约束
    [self addConstraints:@[leftContraint,heightContraint,topContraint, bottomContraint]];
    
    return leftLine;
    
}

- (UIView*)addRightLineWithColor:(UIColor *)color andWidth:(CGFloat)width {
    UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0,width,CGRectGetHeight(self.frame))];
    rightLine.backgroundColor = color;
    rightLine.alpha = 1;
    
    rightLine.translatesAutoresizingMaskIntoConstraints=NO;
    
    [self addSubview:rightLine];
    
    NSLayoutConstraint *rightContraint = [NSLayoutConstraint
                                         constraintWithItem:rightLine
                                         attribute:NSLayoutAttributeRight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                         attribute:NSLayoutAttributeRight
                                         multiplier:1.0f
                                         constant:0.0];
    NSLayoutConstraint *heightContraint = [NSLayoutConstraint
                                        constraintWithItem:rightLine
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                        attribute:NSLayoutAttributeHeight
                                        multiplier:1.0f
                                        constant:0.0];
    
    NSLayoutConstraint *widthContraint = [NSLayoutConstraint
                                         constraintWithItem:rightLine
                                         attribute:NSLayoutAttributeWidth
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0f
                                         constant:width];
    
    NSLayoutConstraint *topContraint = [NSLayoutConstraint
                                        constraintWithItem:rightLine
                                        attribute:NSLayoutAttributeTop
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                        attribute:NSLayoutAttributeTop
                                        multiplier:1.0f
                                        constant:0.0];
    
    NSLayoutConstraint *bottomContraint = [NSLayoutConstraint
                                           constraintWithItem:rightLine
                                           attribute:NSLayoutAttributeBottom
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self
                                           attribute:NSLayoutAttributeBottom
                                           multiplier:1.0f
                                           constant:0.0];
    
    [rightLine addConstraint:widthContraint];
    //给button的父节点添加约束
    [self addConstraints:@[rightContraint,heightContraint, topContraint, bottomContraint]];
    
    return rightLine;
    
}

- (void)addTarget:(id)target action:(SEL)action;
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target
                                                                         action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}
- (UIViewController*)currentViewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
- (void)showPhotoBrowserWithURLs:(NSArray<NSString *> *)urls sourceViews:(NSArray<UIImageView *> *)sourceViews currentSourceView:(UIImageView *)currentSourceView currentIndex:(NSInteger)currentIndex delegate:(id)delegate {
    
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < urls.count; i++) {
        id scourceView = nil;
        if (sourceViews.count == urls.count) {
            scourceView = sourceViews[i];
        }
        if (i == currentIndex) {
            if (currentSourceView) {
                scourceView = currentSourceView;
            }
        }
        if (scourceView) {
            if (![scourceView isKindOfClass:[UIImageView class]]) {
                scourceView = nil;
            }
        }
        KSPhotoItem *item = [KSPhotoItem itemWithSourceView:scourceView imageUrl:[NSURL URLWithString:urls[i]]];
        [items addObject:item];
    }
    
    KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:currentIndex];
    browser.dismissalStyle = KSPhotoBrowserInteractiveDismissalStyleRotation;
    browser.backgroundStyle = KSPhotoBrowserBackgroundStyleBlur;
    browser.loadingStyle = KSPhotoBrowserImageLoadingStyleDeterminate;
    browser.pageindicatorStyle = KSPhotoBrowserPageIndicatorStyleDot;
    browser.bounces = YES;
    browser.delegate = delegate ?: self;
    [browser showFromViewController:CurrentViewController()];
}
@end
