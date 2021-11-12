//
//  AlarmView_Custom_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/15.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import "AlarmView_Custom_ViewController.h"
#import "AlarmView.h"
#import "MHMAlarmView.h"
#import "MHMPopUpView.h"

#import <Masonry.h>

@interface AlarmView_Custom_ViewController ()
@property (strong, nonatomic) AlarmView *alarmView;
@property (strong, nonatomic) MHMAlarmView *mhmAlarmView;
@property (strong, nonatomic) MHMPopUpView *popUpView;
@end

@implementation AlarmView_Custom_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _alarmView = [AlarmView new];
    _mhmAlarmView = [MHMAlarmView new];
    _popUpView = [MHMPopUpView new];
}

- (IBAction)showCustomPromptView:(id)sender {

    [self.view addSubview:self.alarmView];
    [self.alarmView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@300);
        make.height.equalTo(@180);
        make.center.equalTo(self.view);
    }];
}

- (IBAction)showMHMAlarmView:(id)sender {
    
    [self.view addSubview:self.mhmAlarmView];
    [self.mhmAlarmView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@300);
        make.height.equalTo(@180);
        make.center.equalTo(self.view);
    }];
}

- (IBAction)showPopUpView:(id)sender {
    
    [self.popUpView setIconImgNameStr:@"alarm_icon"];
    [self.popUpView setMsgStr:@"马达 001 振动"];
    
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window addSubview:self.popUpView];
    //[self.view addSubview:self.popUpView];
    [self.popUpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(window);
    }];
    
    self.popUpView.actionBlock = ^(NSInteger idx) {
        
    };
}

@end
/*
 
 {"alarmPointTypeID":"2","alarmTypeId":"4","alarmTypeName":"RMS速度骤变","deviceId":"5ee81d6ca532fc31b270c1ec.1.0.1","deviceName":"motorE123","icon":"alarm4","msg":"2020-07-17 10:13:23 motorE123 RMS速度 骤变","reportId":"5f110943ec127f0a465fc699","reportTime":"1594952003","time":"2020-07-17 10:13:23","type":"alarm"}
 
 */
