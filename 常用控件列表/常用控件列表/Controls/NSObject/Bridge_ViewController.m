//
//  Bridge_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/2/27.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "Bridge_ViewController.h"

@interface Bridge_ViewController ()
@property (copy, nonatomic) NSMutableArray *arr;
@property (nonatomic , strong) NSString * mCopyString;
// copy: 建立一个引用计数为1的对象，然后释放原有对象；常常用于NSString/NSArray/NSDictionary(不可变)。
// strong: 常常用于 MSMutableArray ， MSNutableDictionary。
@property (nonatomic , strong) NSMutableArray * mMutableArray;
@end

@implementation Bridge_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // __bridge : 不改变对象的管理权所有者。
    // ARC 管理的 Foundation 对象
    NSString *s1 = @"string";
    // 转换后依然由 ARC 管理释放
    CFStringRef cfstring = (__bridge CFStringRef)s1;
    
    // 开发者手动管理的 Core Foundation 对象
    CFStringRef s2 = CFStringCreateWithCString(NULL, "string", kCFStringEncodingASCII);
    // 转换后仍然需要开发者手动管理释放
    NSString *fstring = (__bridge NSString *)s2;
    
    
    // __bridge_transfer : 用在将 Core Foundation 对象转换成 Foundation 对象时，使对象的内存管理由开发者手动转为ARC管理
    CFStringRef s3 = CFStringCreateWithCString(NULL, "string", kCFStringEncodingASCII);
    // 转换后改由 ARC 管理对象的释放
    NSString *fstring3 = (__bridge_transfer NSString*)s3;
    
    
    // __bridge_retained : 用在将 Foundation 对象转换成 Core Foundation 对象时，剥夺 ARC 对该对象的内存管理权
    NSString *s4 = @"string";
    // 转换后 ARC 不再继续管理，需要手动释放
    CFStringRef cfstring4 = (__bridge_retained CFStringRef)s4;
    //CFStringRef cfstring5 = (CFStringRef)CFBridgingRetain(s1); 等效写法
    
    
    NSMutableString * tempStr = [[NSMutableString alloc] init];
    [tempStr appendFormat:@"test"];
    NSLog(@"%p %@",tempStr,tempStr);
    self.mCopyString = tempStr;
    tempStr = nil;
    NSLog(@"%p %@",self.mCopyString,self.mCopyString);
    NSLog(@"%p %@",tempStr,tempStr);
}

@end
