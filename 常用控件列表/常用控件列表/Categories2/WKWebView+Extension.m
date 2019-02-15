//
//  WKWebView+Extension.m
//  
//
//  Created by peng on 2017/8/25.
//  Copyright © 2017年 peng. All rights reserved.
//

#import "WKWebView+Extension.h"
#import <objc/runtime.h>

@implementation WKWebView (Extension)

//static char imgUrlArrayKey;
static NSArray *imgUrlArrayKey;

- (void)setMethod:(NSArray *)imgUrlArray
{
    objc_setAssociatedObject(self, &imgUrlArrayKey, imgUrlArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)getImgUrlArray
{
    return objc_getAssociatedObject(self, &imgUrlArrayKey);
}


/*
 *通过js获取htlm中图片url
 */
-(NSArray *)getImageUrlByJS:(NSString *)getElementsJsStr
{
    
    //查看大图代码
    //js方法遍历图片添加点击事件返回图片个数
    
//    var objs = document.getElementsByTagName('img');\
    
                                             
//var objs = document.getElementsByClassName('editor_img');\
    
    NSString * jsGetImages = [NSString stringWithFormat:@"function getImages(){\
                              var objs = %@;\
                                            var imgUrlStr='';\
                                            for(var i=0;i<objs.length;i++){\
                                            if(i==0){\
                                            imgUrlStr=objs[i].src;\
                                            }else{\
                                            imgUrlStr+='#'+objs[i].src;\
                                            }\
                                            objs[i].onclick=function(){\
                                            document.location=\"myweb:imageClick:\"+this.src;\
                                            };\
                                            };\
                                            return imgUrlStr;\
                                            };", getElementsJsStr];
    
//    @"function getImages(){\
//    var objs = %@;\
//    var imgUrlStr='';\
//    for(var i=0;i<objs.length;i++){\
//    if(i==0){\
//    if(objs[i].alt==''){\
//    imgUrlStr=objs[i].src;\
//    }\
//    }else{\
//    if(objs[i].alt==''){\
//    imgUrlStr+='#'+objs[i].src;\
//    }\
//    }\
//    objs[i].onclick=function(){\
//    if(this.alt==''){\
//    document.location=\"myweb:imageClick:\"+this.src;\
//    }\
//    };\
//    };\
//    return imgUrlStr;\
//    };"
    
    //用js获取全部图片
    [self evaluateJavaScript:jsGetImages completionHandler:^(id Result, NSError * error) {
//        NSLog(@"js___Result==%@",Result);
//        NSLog(@"js___Error -> %@", error);
        PPLog(@"执行js 注入 %@", Result)
        if (error) {
            PPLog(@"执行js 注入 报错 %@", error)
        }
    }];
    
    
    NSString *js2=@"getImages()";
    
    __block NSArray *array=[NSArray array];
    __weak typeof(self) weakSelf = self;
    [self evaluateJavaScript:js2 completionHandler:^(id Result, NSError * error) {
//        NSLog(@"js2__Result==%@",Result);
//        NSLog(@"js2__Error -> %@", error);
        
        PPLog(@"执行js 执行 %@", Result)
        if (error) {
            PPLog(@"执行js 执行 报错 %@", error)
        }
        
        NSString *resurlt=[NSString stringWithFormat:@"%@",Result];
        
//        if([resurlt hasPrefix:@"#"])
//        {
//            resurlt=[resurlt substringFromIndex:1];
//        }
//        NSLog(@"result===%@",resurlt);
        array=[resurlt componentsSeparatedByString:@"#"];
//        NSLog(@"array====%@",array);
        [weakSelf setMethod:array];
    }];
    
    return array;
}



//显示大图
-(BOOL)showBigImage:(NSURLRequest *)request callBack:(void (^)(NSArray *images, NSInteger index))callBack
{
    //将url转换为string
    NSString *requestString = [[request URL] absoluteString];
    
    //hasPrefix 判断创建的字符串内容是否以pic:字符开始
    if ([requestString hasPrefix:@"myweb:imageClick:"])
    {
        NSString *imageUrl = [requestString substringFromIndex:@"myweb:imageClick:".length];
//        NSLog(@"image url------%@", imageUrl);
        
        NSArray *imgUrlArr=[self getImgUrlArray];
        NSInteger index=0;
        for (NSInteger i=0; i<[imgUrlArr count]; i++) {
            if([imageUrl isEqualToString:imgUrlArr[i]])
            {
                index=i;
                break;
            }
        }
        
//        NSLog(@"%@", imgUrlArr);
//        [WFImageUtilshowImgWithImageURLArray:[NSMutableArrayarrayWithArray:imgUrlArr] index:index myDelegate:nil];
        
        if (callBack) {
            callBack(imgUrlArr, index);
        }
        
        return NO;
    }
    return YES;
}

@end
