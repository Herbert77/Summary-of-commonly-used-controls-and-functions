//
//  ObjMsgSend_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/26.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "ObjMsgSend_ViewController.h"
#import "HHCat.h"
#import <objc/runtime.h>

@interface ObjMsgSend_ViewController ()

@end

@implementation ObjMsgSend_ViewController

/**< 如何在消息的传递过程中，接收者无法响应收到的消息，那么会触发进入消息传递机制。有三道防线，任何一个起作用都可以挽救此次消息转发。 */
- (void)viewDidLoad {
    [super viewDidLoad];

    HHCat *cat = [[HHCat alloc] init];
    [cat instanceMethod];
}

@end
