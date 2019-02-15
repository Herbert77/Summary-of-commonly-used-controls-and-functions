//
//  TextField_LimitInput_VC.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/21.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "TextField_LimitInput_VC.h"
#import "UITextField+InputLimits.h"

@interface TextField_LimitInput_VC () <UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@end

@implementation TextField_LimitInput_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.textField];
}

#pragma mark - Getter
- (UITextField *)textField {
    
    if (!_textField) {
        
        _textField = [[UITextField alloc] init_inputLimits];
        [_textField setFrame:CGRectMake(100, 100, 200, 45)];
        [_textField setBackgroundColor:[UIColor clearColor]];
        [_textField setPlaceholder:@"请输入文本"];
        [_textField setFont:[UIFont systemFontOfSize:16]];
        [_textField setKeyboardType:UIKeyboardTypeDefault];
        [_textField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_textField setClearsOnBeginEditing:NO];
        [_textField setTextAlignment:NSTextAlignmentLeft];
        [_textField setReturnKeyType:UIReturnKeyDone];
        
//        [_textField setDelegate:self];
//        or
//        _textField.isPriceInput = YES;            //是否是输入价格
//        _textField.isPureNumber = YES;            //是否是输入纯文字
//        _textField.maxpriceLength = YES;          //价格最大位数 or 纯文字最大位数 默认9位
//        _textField.isLimitEmoji = YES;            //是否限制输入emoji
//        _textField.isLimitSpecialSymbol = YES;    //是否限制输入特殊符号
//        _textField.maxTextLength = YES;           //最大文字长度
        
    }
    return _textField;
}

#pragma mark - UITextFieldDelegate
// return NO to disallow editing.
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

// return NO to not change text
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    return YES;
}

// 限制输入文本的长度(中文/英文)
#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self p_addObserverForTextField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self p_removeObserverForTextField];
    
    // here: get textfield text
}

#pragma mark - Private
- (void)p_addObserverForTextField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_textFieldContentChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)p_removeObserverForTextField {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)p_textFieldContentChanged:(NSNotification *)noti {
    
    NSInteger maxLength = 15;
    
    UITextField *textField = (UITextField *)noti.object;
    NSString *toBeString = textField.text;
    
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有处在高亮输入中的文本，则对已输入的文字进行字数统计和限制
    if (!position) {
        
        if (toBeString.length > maxLength) {
            
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:maxLength];
            
            if (rangeIndex.length == 1) {
                textField.text = [toBeString substringToIndex:maxLength];
            }
            else {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

@end
