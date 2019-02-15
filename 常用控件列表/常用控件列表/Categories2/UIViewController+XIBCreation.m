//
//  UIViewController+XIBCreation.m
//  SmartCity
//
//  Created by ZCGC on 2017/5/12.
//  Copyright © 2017年 NRH. All rights reserved.
//

#import "UIViewController+XIBCreation.h"

@implementation UIViewController (XIBCreation)

+ (instancetype)loadFromNib {
    NSString *nibName = NSStringFromClass([self class]);
    NSString *path = [[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"];
    if (!path) {
        return [[self alloc] init];
    }
    return [[self alloc] initWithNibName:nibName bundle:nil];
}

@end
