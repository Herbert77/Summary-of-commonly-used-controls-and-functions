//
//  HHAlertController.h
//  常用控件列表
//
//  Created by Herbert Hu on 2019/10/21.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TextFieldDefaultContent @"TextFieldDefaultContent"
#define TextFieldKeyboardType   @"TextFieldKeyboardType"
#define TextFieldPlaceHolder    @"TextFieldPlaceHolder"

typedef void (^AlertActionBlock)(UIAlertAction *action);

@interface HHAlertController : UIAlertController

@property (copy, readonly, nonatomic) AlertActionBlock confirmActionBlock;
@property (copy, readonly, nonatomic) AlertActionBlock cancelActionBlock;

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                     textFieldsConfigArr:(NSArray <NSDictionary *>*)textFieldsConfigArr
                                 confirm:(NSString *)confirmTitle
                                  cancel:(NSString *)cancelTitle
                          confirmHandler:(AlertActionBlock)confirmHandler
                           cancelHandler:(AlertActionBlock)cancelHandler;

- (void)excuteConfirmBlock;
- (void)excuteCancelBlock;

- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification;

@end

