//
//  UILabel+Basic.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/2.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "UILabel+Basic.h"

#define HH_DarkBlackColor [UIColor colorWithHexString:@"#333333"]
#define HH_UsualBlueColor [UIColor colorWithHexString:@"#3B82EE"]
#define HH_DarkGrayColor  [UIColor colorWithHexString:@"#666666"]

@implementation UILabel (Basic)

- (void)configFontSize:(NSInteger)fontSize fontBold:(BOOL)isBold fontColor:(UIColor *)fontColor text:(NSString *)text {
    
    if (isBold) {
        [self setFont:[UIFont boldSystemFontOfSize:fontSize]];
    }
    else {
        [self setFont:[UIFont systemFontOfSize:fontSize]];
    }
    
    [self setTextColor:fontColor];
    [self setText:text];
}

@end
