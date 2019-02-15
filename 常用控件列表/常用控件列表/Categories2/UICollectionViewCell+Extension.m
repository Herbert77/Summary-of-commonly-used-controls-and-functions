//
//  UICollectionViewCell+Extension.m
//  ZXHT
//
//  Created by nrh on 2018/11/5.
//  Copyright © 2018 zxht. All rights reserved.
//

#import "UICollectionViewCell+Extension.h"

@implementation UICollectionViewCell (Extension)

+ (id)cellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath {
    return [collectionView reuseCellClass:[self class] indexPath:indexPath];
}

@end
