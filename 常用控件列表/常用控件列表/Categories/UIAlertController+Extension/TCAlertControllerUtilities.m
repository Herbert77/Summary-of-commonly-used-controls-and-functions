//
//  TCAlertControllerUtilities.m
//  IP3088M
//
//  Created by Herbert Hu on 2019/10/21.
//  Copyright © 2019年 tecomtech. All rights reserved.
//

#import "TCAlertControllerUtilities.h"

@implementation TCAlertControllerUtilities

+ (TCAlertControllerUtilities *)sharedInstance {
    
    static TCAlertControllerUtilities *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TCAlertControllerUtilities alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    [self dismissAlertController];
}

#pragma mark - Actions

- (void)simpleAlertController:(NSString *)info inVC:(nonnull UIViewController *)vc {
    
    [self showAlertControllerWithShowTime:0
                                    title:@""
                                  message:info
                      textFieldsConfigArr:nil
                           cancelBtnTitle:NSLocalizedString(@"confirm_ok", @"")
                            otherBtnTitle:nil
                                     inVC:vc
                           confirmHandler:NULL
                            cancelHandler:NULL];
}

- (void)showAlertControllerWithShowTime:(float)showTime
                                  title:(NSString *)title
                                message:(NSString *)message
                    textFieldsConfigArr:(NSArray <NSDictionary *>*)textFieldsConfigArr
                         cancelBtnTitle:(NSString *)cancelBtnTitle
                          otherBtnTitle:(NSString *)otherBtnTitle
                                   inVC:(UIViewController *)vc
                         confirmHandler:(AlertActionBlock)confirmHandler
                          cancelHandler:(AlertActionBlock)cancelHandler {
    
    [self dismissAlertController];
    
    __weak typeof(self) weakSelf = self;
    _alertController = [HHAlertController alertControllerWithTitle:title message:message textFieldsConfigArr:textFieldsConfigArr confirm:otherBtnTitle cancel:cancelBtnTitle confirmHandler:^(UIAlertAction * _Nonnull action) {
        
        if (weakSelf.alertTimer != nil && [weakSelf.alertTimer isValid]) {
            // invalidate timer.
            [weakSelf.alertTimer invalidate];
            weakSelf.alertTimer = nil;
        }
        weakSelf.alertController = nil;
        
        if (confirmHandler) {
            confirmHandler([UIAlertAction new]);
        }
        
    } cancelHandler:^(UIAlertAction * _Nonnull action) {
        
        if (weakSelf.alertTimer != nil && [weakSelf.alertTimer isValid]) {
            // invalidate timer.
            [weakSelf.alertTimer invalidate];
            weakSelf.alertTimer = nil;
        }
        weakSelf.alertController = nil;
        
        if (cancelHandler) {
            cancelHandler([UIAlertAction new]);
        }
    }];
    
    [vc presentViewController:_alertController animated:NO completion:nil];
    
    if (showTime < 0) {
        // show all the time, do nothing.
    }
    else {
        
        if (showTime == 0) {
            showTime = AlertView_DefaultShowTime;
        }
        
        if (self.alertTimer == nil) {
            _alertTimer = [NSTimer scheduledTimerWithTimeInterval:showTime target:self selector:@selector(dismissAlertController) userInfo:nil repeats:NO];
        }
    }
}

- (void)dismissAlertController
{
    if (self.alertTimer != nil && [self.alertTimer isValid]) {
        // invalidate timer.
        [self.alertTimer invalidate];
        self.alertTimer = nil;
    }
    
    if (self.alertController != nil) {
        // cancel alert view.
        
        __weak typeof(self) weakSelf = self;
        [self.alertController dismissViewControllerAnimated:NO completion:^{
            
            [weakSelf.alertController excuteCancelBlock];
        }];
    }
}

@end
