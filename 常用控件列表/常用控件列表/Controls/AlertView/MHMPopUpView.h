//
//  MHMPopUpView.h
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/15.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHMAlarmView.h"

typedef void(^MHMPopUpViewActionBlock)(NSInteger idx);

NS_ASSUME_NONNULL_BEGIN

@interface MHMPopUpView : UIView

@property (copy, nonatomic) NSString *iconImgNameStr;
@property (copy, nonatomic) NSString *msgStr;

@property (strong, nonatomic) MHMAlarmView *alarmView;
@property (strong, nonatomic) UIView *bgBlackView;

@property (copy, nonatomic) MHMPopUpViewActionBlock actionBlock;

@end

NS_ASSUME_NONNULL_END
