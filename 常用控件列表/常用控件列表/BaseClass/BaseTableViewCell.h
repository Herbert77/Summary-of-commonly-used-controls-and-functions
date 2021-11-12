//
//  BaseTableViewCell.h
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/23.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *instructionLab;
@property (strong, nonatomic) IBOutlet UIView *gifView;

@end

NS_ASSUME_NONNULL_END
