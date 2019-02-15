//
//  NSString+Geometry.m
//  SmartCity
//
//  Created by ZCGC on 2017/5/19.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import "NSString+Geometry.h"

@implementation NSString (Geometry)

-(CGSize)textSizeForMaxWidth:(CGFloat)width{
    return [self textSizeFor:nil maxWidth:width];
}
- (CGSize)textSizeFor:(UIFont *)font maxWidth:(CGFloat)width {
    if (!font) {
        font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
    }
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                     options:(NSStringDrawingUsesFontLeading |
                                              NSStringDrawingUsesLineFragmentOrigin)
                                  attributes:@{NSFontAttributeName: font}
                                     context:nil];
    return rect.size;
}

-(CGFloat)textWidthWithForFont:(UIFont *)font{
    return [self textSizeFor:font maxWidth:CGFLOAT_MAX].width;
}

@end
