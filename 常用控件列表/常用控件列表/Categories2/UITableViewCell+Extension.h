//
//  UITableViewCell+Extension.h
//  ZXHT
//
//  Created by nrh on 2018/11/5.
//  Copyright © 2018 zxht. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (Extension)

+ (id)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
