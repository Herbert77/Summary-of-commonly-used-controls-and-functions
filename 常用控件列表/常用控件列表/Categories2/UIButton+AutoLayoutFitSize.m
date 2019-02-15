//
//  UILabel+AutoLayoutFitSize.m
//  kkyingyu100k
//
//  Created by LSP on 16/7/14.
//  Copyright © 2016年 com.gjh. All rights reserved.
//

#import "UIButton+AutoLayoutFitSize.h"

@implementation UIButton (AutoLayoutFitSize)

-(CGFloat)fitWidth
{
    return [self fitWidthOffset:0];
}
-(CGFloat)fitWidthOffset:(CGFloat)os{
    NSLayoutConstraint *cons = self.widthConstraint;
    if (!cons) {
        return 0;
    }
    cons.constant = [self sizeThatFits:CGSizeMake(99999, self.titleLabel.font.pointSize*1.5)].width + os;
    return cons.constant;
}
//-(CGFloat)fitHeightForWidth:(CGFloat)width
//{
//    return [self fitHeightForWidth:width offset:0];
//}
//-(CGFloat)fitHeightForWidth:(CGFloat)width offset:(CGFloat)os
//{
//    NSLayoutConstraint *cons = self.heightConstraint;
//    if (!cons) {
//        return 0;
//    }
//    cons.constant = [self sizeThatFits:CGSizeMake(width, 99999)].height + os;
//    return cons.constant;
//}


@end

