//
//  UITableView+Extension.m
//  ZXHT
//
//  Created by nrh on 2018/3/15.
//  Copyright © 2018年 zxht. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                     delegate:(id<UITableViewDelegate>)delegate
                   dataSource:(id<UITableViewDataSource>)dataSource
               viewController:(UIViewController *)viewController {
    return [self initWithFrame:frame
                         style:style
                      delegate:delegate
                    dataSource:dataSource
                viewController:viewController
                  headerTarget:nil
                  headerAction:nil
                  footerTarget:nil
                  footerAction:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                     delegate:(id<UITableViewDelegate>)delegate
                   dataSource:(id<UITableViewDataSource>)dataSource
               viewController:(UIViewController *)viewController
                 headerTarget:(id)headerTarget
                 headerAction:(SEL)headerAction {
    return [self initWithFrame:frame
                         style:style
                      delegate:delegate
                    dataSource:dataSource
                viewController:viewController
                  headerTarget:headerTarget
                  headerAction:headerAction
                  footerTarget:nil
                  footerAction:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                     delegate:(id<UITableViewDelegate>)delegate
                   dataSource:(id<UITableViewDataSource>)dataSource
               viewController:(UIViewController *)viewController
                 footerTarget:(id)footerTarget
                 footerAction:(SEL)footerAction {
    return [self initWithFrame:frame
                         style:style
                      delegate:delegate
                    dataSource:dataSource
                viewController:viewController
                  headerTarget:nil
                  headerAction:nil
                  footerTarget:footerTarget
                  footerAction:footerAction];
}

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                     delegate:(id<UITableViewDelegate>)delegate
                   dataSource:(id<UITableViewDataSource>)dataSource
               viewController:(UIViewController *)viewController
                 headerTarget:(id)headerTarget
                 headerAction:(SEL)headerAction
                 footerTarget:(id)footerTarget
                 footerAction:(SEL)footerAction {
    self = [self initWithFrame:frame style:style];
    self.delegate = delegate;
    self.dataSource = dataSource;
    self.estimatedRowHeight = 0;
    self.estimatedSectionHeaderHeight = 0;
    self.estimatedSectionFooterHeight = 0;
    self.showsHorizontalScrollIndicator = NO;
    if (viewController) {
        adjustsScrollViewInsets_NO(self, viewController);
    }
    if (headerTarget) {
        self.mj_header = [HTRefreshNormalHeader headerWithRefreshingTarget:headerTarget refreshingAction:headerAction];
    }
    if (footerTarget) {
        self.mj_footer = [HTRefreshAutoNormalFooter footerWithRefreshingTarget:footerTarget refreshingAction:footerAction];
    }
    return self;
}

- (void)registerCellClass:(Class)cellClass {
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerNibCellClass:(Class)cellClass {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerCellClassArray:(NSArray *)classArray {
    for (Class class in classArray) {
        [self registerCellClass:class];
    }
}

- (__kindof UITableViewCell *)reuseCellClass:(Class)cellClass {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
}

- (__kindof UITableViewCell *)reuseCellClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath{
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
}

- (void)registerViewClass:(Class)viewClass {
    [self registerClass:viewClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(viewClass)];
}

- (void)registerViewClassArray:(NSArray *)classArray {
    for (Class class in classArray) {
        [self registerViewClass:class];
    }
}

- (__kindof UITableViewHeaderFooterView *)reuseViewClass:(Class)viewClass {
    return [self dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(viewClass)];
}

@end
