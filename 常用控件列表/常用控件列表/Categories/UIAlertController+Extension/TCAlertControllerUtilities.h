//
//  TCAlertControllerUtilities.h
//  IP3088M
//
//  Created by Herbert Hu on 2019/10/21.
//  Copyright © 2019年 tecomtech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHAlertController.h"
#import "UIView+CurrentController.h"

#define AlertView_DefaultShowTime 3.0

@interface TCAlertControllerUtilities : NSObject

@property (strong, nonatomic) HHAlertController *alertController;
@property (strong, nonatomic) NSTimer *alertTimer;

+ (TCAlertControllerUtilities *)sharedInstance;

- (void)showAlertControllerWithShowTime:(float)showTime
                                  title:(NSString *)title
                                message:(NSString *)message
                    textFieldsConfigArr:(NSArray <NSDictionary *>*)textFieldsConfigArr
                         cancelBtnTitle:(NSString *)cancelBtnTitle
                          otherBtnTitle:(NSString *)otherBtnTitle
                                   inVC:(UIViewController *)vc
                         confirmHandler:(AlertActionBlock)confirmHandler
                          cancelHandler:(AlertActionBlock)cancelHandler;

- (void)dismissAlertController;
- (void)simpleAlertController:(NSString *)info inVC:(UIViewController *)vc;

@end

