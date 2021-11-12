//
//  MHMPopUpView.m
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/15.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import "MHMPopUpView.h"
#import "Masonry.h"

@implementation MHMPopUpView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customProperties];
    }
    return self;
}

- (void)customProperties {
    
    [self addSubview:self.bgBlackView];
    [self.bgBlackView addSubview:self.alarmView];
    
    __weak typeof(self) weakSelf = self;
    self.alarmView.actionBlock = ^(NSInteger idx) {
        weakSelf.actionBlock(idx);
//        [weakSelf.alarmView removeFromSuperview];
//        [weakSelf.bgBlackView removeFromSuperview];
        [weakSelf removeFromSuperview];
    };
    
    [self.bgBlackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    
    [self.alarmView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@300);
        make.height.equalTo(@180);
        make.center.equalTo(weakSelf.bgBlackView);
    }];
}

#pragma mark - Getter
- (UIView *)bgBlackView {
    if (!_bgBlackView) {
        _bgBlackView = [UIView new];
        [_bgBlackView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    }
    return _bgBlackView;
}

- (MHMAlarmView *)alarmView {
    if (!_alarmView) {
        _alarmView = [MHMAlarmView new];
    }
    return _alarmView;
}

#pragma mark - Setter
- (void)setIconImgNameStr:(NSString *)iconImgNameStr {
    _iconImgNameStr = iconImgNameStr;
    // HH_TODO: need to replace image name.
    [self.alarmView.imgV setImage:[UIImage imageNamed:iconImgNameStr ? :@"alarm_icon"]];
}

- (void)setMsgStr:(NSString *)msgStr {
    _msgStr = msgStr;
    [self.alarmView.tipLab setText:msgStr];
}

@end
