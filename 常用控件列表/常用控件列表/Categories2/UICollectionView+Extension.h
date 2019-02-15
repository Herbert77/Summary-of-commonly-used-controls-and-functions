//
//  UICollectionView+Extension.h
//  ZXHT
//
//  Created by nrh on 2018/3/15.
//  Copyright © 2018年 zxht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Extension)

- (instancetype)initWithFrame:(CGRect)frame
              scrollDirection:(UICollectionViewScrollDirection)scrollDirection
      minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
           minimumLineSpacing:(CGFloat)minimumLineSpacing
                     itemSize:(CGSize)itemSize
                 sectionInset:(UIEdgeInsets)sectionInset
           flowLayoutDeleaget:(id<UICollectionViewDelegateFlowLayout>)flowLayoutDeleaget
                   dataSource:(id<UICollectionViewDataSource>)dataSource
               viewController:(UIViewController *)viewController;

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
                 footerAction:(SEL)footerAction;

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
                 headerAction:(SEL)headerAction;

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
                 footerAction:(SEL)footerAction;

- (void)registerCellClass:(Class)cellClass;

- (void)registerNibCellClass:(Class)cellClass;

- (void)registerCellClassArray:(NSArray *)classArray;

- (__kindof UICollectionViewCell *)reuseCellClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath;

- (void)registerViewClass:(Class)viewClass viewOfKind:(NSString *)viewKind;

- (void)registerViewClassArray:(NSArray *)classArray viewOfKind:(NSString *)viewKind;

- (__kindof UICollectionReusableView *)reuseViewClass:(Class)viewClass viewOfKind:(NSString *)viewKind indexPath:(NSIndexPath *)indexPath;

@end
