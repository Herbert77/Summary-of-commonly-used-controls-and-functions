//
//  NSTimer+Extension.h
//  ZXHT
//
//  Created by Cz on 2018/6/12.
//  Copyright © 2018年 zxht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Extension)

- (void)pause;
- (void)resume;
- (void)resumeWithTimeInterval:(NSTimeInterval)time;

+ (NSTimer *)wy_scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo block:(void(^)(NSTimer *timer))block;

@end
