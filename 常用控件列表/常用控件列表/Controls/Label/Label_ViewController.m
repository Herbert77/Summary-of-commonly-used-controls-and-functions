//
//  Label_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2018/1/30.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "Label_ViewController.h"

@interface Label_ViewController ()
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *label2;
@end

@implementation Label_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    [self.view addSubview:self.label2];
}

- (UILabel *)label {
    
    if (!_label) {
        
        _label = [[UILabel alloc] init];
        [_label setFrame:CGRectMake(100, 100, 200, 45)];
        [_label setText:@"good morning."];
        [_label setTextColor:[UIColor orangeColor]];
        [_label setBackgroundColor:[UIColor purpleColor]];
        [_label setFont:[UIFont systemFontOfSize:16]];
        [_label setTextAlignment:NSTextAlignmentCenter];
        [_label setNumberOfLines:0];
        [_label sizeToFit];
    }
    return _label;
}

- (UILabel *)label2 {
    
    if (!_label2) {
        
        _label2 = [[UILabel alloc] init];
        [_label2 setFrame:CGRectMake(100, 200, 200, 45)];
        [_label2 setText:@"good morning."];
        [_label2 setTextColor:[UIColor orangeColor]];
        [_label2 setBackgroundColor:[UIColor purpleColor]];
        [_label2 setFont:[UIFont systemFontOfSize:16]];
        [_label2 setTextAlignment:NSTextAlignmentCenter];
        [_label2 setNumberOfLines:0];
        
        [_label2.layer setBorderColor:[UIColor redColor].CGColor];
        [_label2.layer setBorderWidth:1.0];
    }
    return _label2;
}

@end
