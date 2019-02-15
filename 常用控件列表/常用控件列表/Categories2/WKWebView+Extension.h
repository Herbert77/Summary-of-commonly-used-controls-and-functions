//
//  WKWebView+Extension.h
//  
//
//  Created by peng on 2017/8/25.
//  Copyright © 2017年 peng. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface WKWebView (Extension)

-(NSArray *)getImageUrlByJS:(NSString *)getElementsJsStr;

-(BOOL)showBigImage:(NSURLRequest *)request callBack:(void (^)(NSArray *images, NSInteger index))callBack;

@end
