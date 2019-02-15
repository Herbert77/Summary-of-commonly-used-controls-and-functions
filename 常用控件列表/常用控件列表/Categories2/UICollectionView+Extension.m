//
//  UICollectionView+Extension.m
//  ZXHT
//
//  Created by nrh on 2018/3/15.
//  Copyright © 2018年 zxht. All rights reserved.
//

#import "UICollectionView+Extension.h"

@implementation UICollectionView (Extension)

- (instancetype)initWithFrame:(CGRect)frame
              scrollDirection:(UICollectionViewScrollDirection)scrollDirection
      minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
           minimumLineSpacing:(CGFloat)minimumLineSpacing
                     itemSize:(CGSize)itemSize
                 sectionInset:(UIEdgeInsets)sectionInset
           flowLayoutDeleaget:(id<UICollectionViewDelegateFlowLayout>)flowLayoutDeleaget
                   dataSource:(id<UICollectionViewDataSource>)dataSource
               viewController:(UIViewController *)viewController {
    return [self initWithFrame:frame
               scrollDirection:scrollDirection
       minimumInteritemSpacing:minimumInteritemSpacing
            minimumLineSpacing:minimumLineSpacing
                      itemSize:itemSize
                  sectionInset:sectionInset
            flowLayoutDeleaget:flowLayoutDeleaget
                    dataSource:dataSource
                viewController:viewController
                  headerTarget:nil
                  headerAction:nil
                  footerTarget:nil
                  footerAction:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
              scrollDirection:(UICollectionViewScrollDirection)scrollDirection
      minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
           minimumLineSpacing:(CGFloat)minimumLineSpacing
                     itemSize:(CGSize)itemSize
                 sectionInset:(UIEdgeInsets)sectionInset
           flowLayoutDeleaget:(id<UICollectionViewDelegateFlowLayout>)flowLayoutDeleaget
                   dataSource:(id<UICollectionViewDataSource>)dataSource
               viewController:(UIViewController *)viewController
                 headerTarget:(id)headerTarget
                 headerAction:(SEL)headerAction {
    return [self initWithFrame:frame
               scrollDirection:scrollDirection
       minimumInteritemSpacing:minimumInteritemSpacing
            minimumLineSpacing:minimumLineSpacing
                      itemSize:itemSize
                  sectionInset:sectionInset
            flowLayoutDeleaget:flowLayoutDeleaget
                    dataSource:dataSource
                viewController:viewController
                  headerTarget:headerTarget
                  headerAction:headerAction
                  footerTarget:nil
                  footerAction:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
              scrollDirection:(UICollectionViewScrollDirection)scrollDirection
      minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
           minimumLineSpacing:(CGFloat)minimumLineSpacing
                     itemSize:(CGSize)itemSize
                 sectionInset:(UIEdgeInsets)sectionInset
           flowLayoutDeleaget:(id<UICollectionViewDelegateFlowLayout>)flowLayoutDeleaget
                   dataSource:(id<UICollectionViewDataSource>)dataSource
               viewController:(UIViewController *)viewController
                 footerTarget:(id)footerTarget
                 footerAction:(SEL)footerAction {
    return [self initWithFrame:frame
               scrollDirection:scrollDirection
       minimumInteritemSpacing:minimumInteritemSpacing
            minimumLineSpacing:minimumLineSpacing
                      itemSize:itemSize
                  sectionInset:sectionInset
            flowLayoutDeleaget:flowLayoutDeleaget
                    dataSource:dataSource
                viewController:viewController
                  headerTarget:nil
                  headerAction:nil
                  footerTarget:footerTarget
                  footerAction:footerAction];
}

- (instancetype)initWithFrame:(CGRect)frame
              scrollDirection:(UICollectionViewScrollDirection)scrollDirection
      minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
           minimumLineSpacing:(CGFloat)minimumLineSpacing
                     itemSize:(CGSize)itemSize
                 sectionInset:(UIEdgeInsets)sectionInset
           flowLayoutDeleaget:(id<UICollectionViewDelegateFlowLayout>)flowLayoutDeleaget
                   dataSource:(id<UICollectionViewDataSource>)dataSource
               viewController:(UIViewController *)viewController
                 headerTarget:(id)headerTarget
                 headerAction:(SEL)headerAction
                 footerTarget:(id)footerTarget
                 footerAction:(SEL)footerAction {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection         = scrollDirection;
    layout.minimumLineSpacing      = minimumLineSpacing;
    layout.minimumInteritemSpacing = minimumInteritemSpacing;
    layout.itemSize                = itemSize;
    layout.sectionInset            = sectionInset;
    self = [self initWithFrame:frame collectionViewLayout:layout];
    self.backgroundColor = [UIColor clearColor];
    self.delegate        = flowLayoutDeleaget;
    self.dataSource      = dataSource;
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
    [self registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerNibCellClass:(Class)cellClass {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerCellClassArray:(NSArray *)classArray {
    for (Class class in classArray) {
        [self registerCellClass:class];
    }
}

- (void)registerViewClass:(Class)viewClass viewOfKind:(NSString *)viewKind {
    [self registerClass:viewClass forSupplementaryViewOfKind:viewKind  withReuseIdentifier:NSStringFromClass(viewClass)];
}

- (void)registerViewClassArray:(NSArray *)classArray viewOfKind:(NSString *)viewKind {
    for (Class class in classArray) {
        [self registerViewClass:class viewOfKind:viewKind];
    }
}

- (__kindof UICollectionViewCell *)reuseCellClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
}

- (__kindof UICollectionReusableView *)reuseViewClass:(Class)viewClass viewOfKind:(NSString *)viewKind indexPath:(NSIndexPath *)indexPath {
    return [self dequeueReusableSupplementaryViewOfKind:viewKind withReuseIdentifier:NSStringFromClass(viewClass) forIndexPath:indexPath];
}

@end
