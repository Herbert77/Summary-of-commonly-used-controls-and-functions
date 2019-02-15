//
//  UITextField+AutoLayoutFitSize.m
//  ZXHT
//
//  Created by LSP on 2018/11/27.
//  Copyright © 2018 zxht. All rights reserved.
//

#import "UITextField+AutoLayoutFitSize.h"

@implementation UITextField (AutoLayoutFitSize)

-(CGFloat)fitWidth
{
    return [self fitWidthOffset:0];
}
-(CGFloat)fitWidthOffset:(CGFloat)os{
    NSLayoutConstraint *cons = self.widthConstraint;
    if (!cons) {
        return 0;
    }
    cons.constant = [self sizeThatFits:CGSizeMake(99999, self.font.pointSize*1.5)].width + os;
    return cons.constant;
}
-(CGFloat)fitHeightForWidth:(CGFloat)width
{
    return [self fitHeightForWidth:width offset:0];
}
-(CGFloat)fitHeightForWidth:(CGFloat)width offset:(CGFloat)os
{
    NSLayoutConstraint *cons = self.heightConstraint;
    if (!cons) {
        return 0;
    }
    cons.constant = [self sizeThatFits:CGSizeMake(width, 99999)].height + os;
    return cons.constant;
}

@end
