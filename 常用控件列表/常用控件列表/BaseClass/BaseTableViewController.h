//
//  BaseTableViewController.h
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/21.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray *titleModuleArray;
@property (strong, nonatomic) NSMutableArray *subControllerNameModuleArray;
@end

NS_ASSUME_NONNULL_END
