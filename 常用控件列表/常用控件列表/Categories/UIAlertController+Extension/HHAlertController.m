//
//  HHAlertController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/10/21.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "HHAlertController.h"

@interface HHAlertController () <UITextFieldDelegate>

@property (copy, readwrite, nonatomic) AlertActionBlock confirmActionBlock;
@property (copy, readwrite, nonatomic) AlertActionBlock cancelActionBlock;
@property (assign, nonatomic) NSInteger textFieldsCount;
@property (weak, nonatomic)   UIAlertAction *confirmAction;
@property (assign, nonatomic) BOOL confirmActionIsEnabled;

@end

@implementation HHAlertController

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 message:(NSString *)message
                     textFieldsConfigArr:(NSArray <NSDictionary *>*)textFieldsConfigArr
                                 confirm:(NSString *)confirmTitle
                                  cancel:(NSString *)cancelTitle
                          confirmHandler:(AlertActionBlock)confirmHandler
                           cancelHandler:(AlertActionBlock)cancelHandler {
    
    HHAlertController *ac = [HHAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    ac.textFieldsCount = [textFieldsConfigArr count];
    
    __weak typeof(ac) weakAc = ac;
    
    if (ac.textFieldsCount) {
        
        for (int i=0; i<[textFieldsConfigArr count]; i++) {
            
            NSDictionary *keyDic = [textFieldsConfigArr objectAtIndex:i];
            [ac addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                
                [textField setTag:i+100];
                
                NSString *content = [keyDic objectForKey:TextFieldDefaultContent];
                
                if (content && [content length]) {
                    [textField setText:content];
                    weakAc.confirmActionIsEnabled = YES;
                }
                
                NSInteger keyboardType = [[keyDic objectForKey:TextFieldKeyboardType] integerValue];
                
                if (keyboardType>=0 && keyboardType<=12) {
                    [textField setKeyboardType:keyboardType];
                }
                
                NSString *placeHolder = [keyDic objectForKey:TextFieldPlaceHolder];
                
                if (placeHolder && [placeHolder length]) {
                    [textField setPlaceholder:placeHolder];
                }
                
                [[NSNotificationCenter defaultCenter] addObserver:weakAc selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
            }];
        }
    }
    
    if (confirmTitle && [confirmTitle length] && confirmHandler) {
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            confirmHandler(action);
            [weakAc removeTextFieldsObserverForObj:weakAc];
        }];
        [ac addAction:confirm];
        [ac setConfirmAction:confirm];
        [ac setConfirmActionBlock:confirmHandler];
    
        [confirm setEnabled:weakAc.confirmActionIsEnabled];
    }
    
    if (cancelTitle && [cancelTitle length] && cancelHandler) {
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            cancelHandler(action);
            [weakAc removeTextFieldsObserverForObj:weakAc];
        }];
        [ac addAction:cancel];
        [ac setCancelActionBlock:cancelHandler];
    }
    
    return ac;
}

- (void)excuteConfirmBlock {
    
    if (self.confirmActionBlock) {
        self.confirmActionBlock([UIAlertAction new]);
    }
}

- (void)excuteCancelBlock {
    
    if (self.cancelActionBlock) {
        self.cancelActionBlock([UIAlertAction new]);
    }
}

- (void)removeTextFieldsObserverForObj:(HHAlertController *)alertVC {
    
    for (UITextField *textField in [self textFields]) {
        [[NSNotificationCenter defaultCenter] removeObserver:alertVC name:UITextFieldTextDidChangeNotification object:textField];
    }
}

#pragma mark - Noti
- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
    UITextField *textField = notification.object;
    
    if (self.confirmAction) {
        [self.confirmAction setEnabled:(textField.text.length > 0)];
    }
}

@end
