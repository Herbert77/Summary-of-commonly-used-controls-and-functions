//
//  HHPastedLabel.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/5/9.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "HHPastedLabel.h"

@implementation HHPastedLabel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress)]];
}

- (void)longPress {
    
    // 设置label为第一响应者
    [self becomeFirstResponder];
    
    // 自定义 UIMenuController
    UIMenuController * menu = [UIMenuController sharedMenuController];
    UIMenuItem * item1 = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(copyText:)];
    menu.menuItems = @[item1];
    [menu setTargetRect:self.bounds inView:self];
    [menu setMenuVisible:YES animated:YES];
}

- (void)copyText:(UIMenuController *)menu {
    // 没有文字时结束方法
    if (!self.text) return;
    // 复制文字到剪切板
    UIPasteboard * paste = [UIPasteboard generalPasteboard];
    paste.string = self.text;
}

#pragma mark - Overide
- (BOOL)canBecomeFirstResponder {
    return YES;
}

@end
