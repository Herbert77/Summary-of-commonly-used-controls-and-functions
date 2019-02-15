//
//  UIView+LayoutConstraints.h
//  UIViewConstraints
//
//  Created by ZCGC on 2015/7/20.
//  Copyright © 2017年 LSP. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LayoutConstraints)

/**
 是否需要识别约束到对应的属性当中.
 */
@property (nonatomic, assign) BOOL recognizeConstraintToPropeties;

/**
 本视图宽度的约束. 如果在XIB中已创建该约束，则会自动关联到本属性。
 若未创建，则在调用getter时会自动创建，默认constant为0.
*/
@property (nonatomic, assign, nullable) IBOutlet NSLayoutConstraint *widthConstraint;
@property (nonatomic, assign) CGFloat widthConstant;

/**
 本视图高度的约束. 如果在XIB中已创建该约束，则会自动关联到本属性。
 若未创建，则在调用getter时会自动创建，默认constant为0.
*/
@property (nonatomic, assign, nullable) IBOutlet NSLayoutConstraint *heightConstraint;
@property (nonatomic, assign) CGFloat heightConstant;

/**
 本视图左边距离父视图的约束. 如果在XIB中已创建该约束，则会自动关联到本属性。
 若未创建，则在调用getter时会自动创建，默认constant为0.
*/
@property (nonatomic, assign, nullable) IBOutlet NSLayoutConstraint *leftConstraint;
@property (nonatomic, assign) CGFloat leftConstant;

/**
 本视图顶部距离父视图的约束. 如果在XIB中已创建该约束，则会自动关联到本属性。
 若未创建，则在调用getter时会自动创建，默认constant为0.
 */
@property (nonatomic, assign, nullable) IBOutlet NSLayoutConstraint *topConstraint;
@property (nonatomic, assign) CGFloat topConstant;

/**
 本视图右边距离父视图的约束. 如果在XIB中已创建该约束，则会自动关联到本属性。
 若未创建，则在调用getter时会自动创建，默认constant为0.
*/
@property (nonatomic, assign, nullable) IBOutlet NSLayoutConstraint *rightConstraint;
@property (nonatomic, assign) CGFloat rightConstant;

/**
 本视图底部距离父视图的约束. 如果在XIB中已创建该约束，则会自动关联到本属性。
 若未创建，则在调用getter时会自动创建，默认constant为0.
*/
@property (nonatomic, assign, nullable) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (nonatomic, assign) CGFloat bottomConstant;

/**
 本视图与父视图水平放心中心对齐的约束. 如果在XIB中已创建该约束，则会自动关联到本属性。
 若未创建，则在调用getter时会自动创建，默认constant为0.
 */
@property (nonatomic, assign, nullable) IBOutlet NSLayoutConstraint *centerXConstraint;
@property (nonatomic, assign) CGFloat centerXConstant;


/**
 本视图与父视图竖直放心中心对齐的约束. 如果在XIB中已创建该约束，则会自动关联到本属性。
 若未创建，则在调用getter时会自动创建，默认constant为0.
 */
@property (nonatomic, assign, nullable) IBOutlet NSLayoutConstraint *centerYConstraint;
@property (nonatomic, assign) CGFloat centerYConstant;

/**
 本视图与另一视图view保持对齐。如果约束未设置则会自动创建(并让父视图调用addConstraint:使约束生效)。constant默认为0.
 leadingEqualToView: 视图的左边与view的左边保持对齐，设置constant则为两视图的左边所保持的距离。以下同理。
 trailingEqualToView:
 topEqualToView:
 bottomEqualToView:
 
 @param view 被参照的视图。
 @return 所约束两个视图的约束对象。
 */
- (NSLayoutConstraint *)leadingEqualToView:(UIView *)view;
- (NSLayoutConstraint *)trailingEqualToView:(UIView *)view;
- (NSLayoutConstraint *)topEqualToView:(UIView *)view;
- (NSLayoutConstraint *)bottomEqualToView:(UIView *)view;


/**
 本视图与另一视图view保持的距离。如果约束未设置则会自动创建(并让父视图调用addConstraint:使约束生效)。
 leadingSpacingToView:  视图的左边与view的右边保持的距离，设置constant则为本视图的左边与view的右边所保持的距离。
 trailingSpacingToView: 视图的右边与view的左边保持的距离，设置constant则为本视图的右边与view的左边所保持的距离。
 topSpacingToView:      视图的顶部与view的底部保持的距离，设置constant则为本视图的顶部与view的底部所保持的距离。
 bottomSpacingToView:   视图的底部与view的顶部保持的距离，设置constant则为本视图的底部与view的顶部所保持的距离。
 
 @param view 被参照的视图。
 @return 所约束两个视图的约束对象。
 */
- (NSLayoutConstraint *)leadingSpacingToView:(UIView *)view;
- (NSLayoutConstraint *)trailingSpacingToView:(UIView *)view;
- (NSLayoutConstraint *)topSpacingToView:(UIView *)view;
- (NSLayoutConstraint *)bottomSpacingToView:(UIView *)view;


@end

NS_ASSUME_NONNULL_END
