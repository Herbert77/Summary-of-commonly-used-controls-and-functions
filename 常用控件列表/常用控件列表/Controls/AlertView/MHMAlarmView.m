//
//  MHMAlarmView.m
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/15.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import "MHMAlarmView.h"

@implementation MHMAlarmView

- (void)customProperties {
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];
//    
//    [self.imgV setImage:[UIImage imageNamed:@"alarm_icon"]];
//    
//    [self.tipLab setText:@"马达 001 振动告警"];
    [self.tipLab setTextColor:[UIColor whiteColor]];
    
    [self.leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.rightBtn setTitle:@"查看" forState:UIControlStateNormal];

    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"cancelBtn_normal"] forState:UIControlStateNormal];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"cancelBtn_select"] forState:UIControlStateHighlighted];
    
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"lookBtn_normal"] forState:UIControlStateNormal];
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"lookBtn_select"] forState:UIControlStateHighlighted];
}

@end
