//
//  UITableViewCell+Extension.m
//  ZXHT
//
//  Created by nrh on 2018/11/5.
//  Copyright © 2018 zxht. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

+ (id)cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    return [tableView reuseCellClass:[self class] indexPath:indexPath];
}

@end
