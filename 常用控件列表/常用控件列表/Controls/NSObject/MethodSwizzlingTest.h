//
//  MethodSwizzlingTest.h
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/27.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MethodSwizzlingTest : NSObject

// 定义两个公有的实例方法
- (void)instanceMethod1;
- (void)instanceMethod2;

// 定义两个公有的类方法
+ (void)classMethod1;
+ (void)classMethod2;

- (void)newInsMethod;

@end

NS_ASSUME_NONNULL_END
