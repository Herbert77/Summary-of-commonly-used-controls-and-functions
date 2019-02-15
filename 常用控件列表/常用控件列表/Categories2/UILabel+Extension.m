//
//  UILabel+Extension.m
//  ZXHT
//
//  Created by 洪欣 on 2017/6/17.
//  Copyright © 2017年 zxht. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
- (CGFloat)getTextWidth
{
    CGSize newSize = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.pp_height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    return newSize.width;
}

- (CGFloat)getTextHeight
{
    CGSize newSize = [self.text boundingRectWithSize:CGSizeMake(self.pp_width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    return newSize.height;
}

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
