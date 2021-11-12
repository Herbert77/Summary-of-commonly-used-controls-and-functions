//
//  UIView+CurrentController.m
//  IP3088M
//
//  Created by Herbert Hu on 2019/10/24.
//  Copyright © 2019年 tecomtech. All rights reserved.
//

#import "UIView+CurrentController.h"

@implementation UIView (CurrentController)

- (UIViewController *)getCurrentViewController {
    
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}

@end
