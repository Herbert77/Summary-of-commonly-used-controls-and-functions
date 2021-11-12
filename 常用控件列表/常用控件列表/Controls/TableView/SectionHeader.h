//
//  SectionHeader.h
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/19.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SectionHeaderBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface SectionHeader : UIView
@property (copy, nonatomic) SectionHeaderBlock sectionHeaderBlock;
@end

NS_ASSUME_NONNULL_END
