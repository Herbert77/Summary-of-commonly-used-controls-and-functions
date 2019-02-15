//
//  NSString+JsonExtension.m
//  ZXHT
//
//  Created by peng on 2018/1/25.
//  Copyright © 2018年 zxht. All rights reserved.
//

#import "NSString+JsonExtension.h"
#import "NSDate+Extension.h"

@implementation NSString (JsonExtension)

/**
 json格式字符串转字典
 */
- (NSDictionary *)jsonStringToDictionary {
    
    if (self == nil || self.length == 0) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        PPLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}

+ (NSString *)randomStringWithLength:(int)length {
    NSString *string = @"";
    for (int i = 0; i < length; i++) {
        int number = arc4random() % 62;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        } else if (number < 36){
            int figure = (arc4random() % 26) + 65;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        } else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return string;
}
- (NSString *)stringByDeletingPictureResolution {
    NSString *doubleResolution  = @"@2x";
    NSString *tribleResolution = @"@3x";
    NSString *fileName = self.stringByDeletingPathExtension;
    NSString *res = [self copy];
    if ([fileName hasSuffix:doubleResolution] || [fileName hasSuffix:tribleResolution]) {
        res = [fileName substringToIndex:fileName.length - 3];
        if (self.pathExtension.length) {
            res = [res stringByAppendingPathExtension:self.pathExtension];
        }
    }
    return res;
}

- (NSString *)dateStringWithFormat:(NSString *)str {
    NSString *formtStr;
    NSDate *date = [NSDate date:self WithFormat:str];
    if ([date isToday]) {
        formtStr = [NSString stringWithFormat:@"今天 %@",[date stringWithFormat:@"HH:mm"]];
    }else if ([date isYesterday]) {
        formtStr = [NSString stringWithFormat:@"昨天 %@",[date stringWithFormat:@"HH:mm"]];
    }else if ([date isThisYear]) {
        formtStr = [date stringWithFormat:@"MM.dd HH:mm"];
    }else {
        formtStr = [date stringWithFormat:@"yyyy.MM.dd HH:mm"];
    }
    return formtStr;
}
@end
