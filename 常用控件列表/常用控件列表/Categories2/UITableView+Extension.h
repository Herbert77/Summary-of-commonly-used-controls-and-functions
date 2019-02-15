//
//  UITableView+Extension.h
//  ZXHT
//
//  Created by nrh on 2018/3/15.
//  Copyright © 2018年 zxht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                     delegate:(id<UITableViewDelegate>)delegate
                   dataSource:(id<UITableViewDataSource>)dataSource
               viewController:(UIViewController *)viewController;

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                     delegate:(id<UITableViewDelegate>)delegate
                   dataSource:(id<UITableViewDataSource>)dataSource
               viewController:(UIViewController *)viewController
                 headerTarget:(id)headerTarget
                 headerAction:(SEL)headerAction;

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                     delegate:(id<UITableViewDelegate>)delegate
                   dataSource:(id<UITableViewDataSource>)dataSource
               viewController:(UIViewController *)viewController
                 footerTarget:(id)footerTarget
                 footerAction:(SEL)footerAction;

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                     delegate:(id<UITableViewDelegate>)delegate
                   dataSource:(id<UITableViewDataSource>)dataSource
               viewController:(UIViewController *)viewController
                 headerTarget:(id)headerTarget
                 headerAction:(SEL)headerAction
                 footerTarget:(id)footerTarget
                 footerAction:(SEL)footerAction;

//使用cell类名作为cell注册id
- (void)registerCellClass:(Class)cellClass;

- (void)registerNibCellClass:(Class)cellClass;

//cell类组合的数组，遍历注册多类型cell
- (void)registerCellClassArray:(NSArray *)classArray;

- (__kindof UITableViewCell *)reuseCellClass:(Class)cellClass;

- (__kindof UITableViewCell *)reuseCellClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath;

//使用view类名作为HeaderFooterView注册id
- (void)registerViewClass:(Class)viewClass;

//view类组合的数组，遍历注册多类型HeaderFooterView
- (void)registerViewClassArray:(NSArray *)classArray;

- (__kindof UITableViewHeaderFooterView *)reuseViewClass:(Class)viewClass;

@end
