//
//  Person.h
//  常用控件列表
//
//  Created by Herbert Hu on 2019/2/26.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;

+ (Person *)personWithName:(NSString *)name age:(NSInteger)age;

@end

NS_ASSUME_NONNULL_END
