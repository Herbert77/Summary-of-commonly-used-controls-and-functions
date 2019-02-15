//
//  RichText_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/23.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "RichText_ViewController.h"
#import "RichText_IMRichTextEditor_ViewController.h"
@interface RichText_ViewController ()

@end

@implementation RichText_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // custom configuration
    [self.titleModuleArray addObject:@"IM富文本编辑器（from XhiDaShi）"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([RichText_IMRichTextEditor_ViewController class])];
}

@end
