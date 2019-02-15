//
//  NSArray+DeepCopy.h
//  ZXHT
//
//  Created by LSP on 2018/12/31.
//  Copyright © 2018 zxht. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (DeepCopy)
- (instancetype)deepCopy;
- (NSMutableArray *)mutableDeepCopy;
@end

NS_ASSUME_NONNULL_END
