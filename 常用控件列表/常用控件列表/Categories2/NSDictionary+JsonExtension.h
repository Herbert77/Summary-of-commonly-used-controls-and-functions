//
//  NSDictionary+JsonExtension.h
//  ZXHT
//
//  Created by peng on 2018/1/25.
//  Copyright © 2018年 zxht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JsonExtension)

/**
 字典转json格式字符串
 */
- (NSString *)dictionaryToJsonString;

- (NSString *)jsonString: (NSString *)key;

- (NSDictionary *)jsonDict: (NSString *)key;
- (NSArray *)jsonArray: (NSString *)key;
- (NSArray *)jsonStringArray: (NSString *)key;


- (BOOL)jsonBool: (NSString *)key;
- (NSInteger)jsonInteger: (NSString *)key;
- (long long)jsonLongLong: (NSString *)key;
- (unsigned long long)jsonUnsignedLongLong:(NSString *)key;

- (double)jsonDouble: (NSString *)key;
@end
