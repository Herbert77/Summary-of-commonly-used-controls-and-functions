//
//  AlarmView.h
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/15.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(NSInteger idx);

NS_ASSUME_NONNULL_BEGIN

@interface AlarmView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *tipLab;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (copy, nonatomic) ActionBlock actionBlock;

@end

NS_ASSUME_NONNULL_END
