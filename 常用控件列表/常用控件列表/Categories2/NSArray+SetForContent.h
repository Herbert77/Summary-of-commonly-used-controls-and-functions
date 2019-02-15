//
//  NSArray+SetForContent.h
//  ZXHT
//
//  Created by LSP on 2018/11/26.
//  Copyright © 2018 zxht. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SetForContent)
- (NSArray *)arrayFromObjectsForKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
