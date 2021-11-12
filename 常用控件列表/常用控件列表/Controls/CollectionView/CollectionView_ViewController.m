//
//  CollectionView_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2020/1/9.
//  Copyright © 2020年 Herbert Hu. All rights reserved.
//

#import "CollectionView_ViewController.h"
#import "CollectionView_DragAndSort_ViewController.h"

@interface CollectionView_ViewController ()

@end

@implementation CollectionView_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@" CollectionView 的拖拽和排序"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([CollectionView_DragAndSort_ViewController class])];
}

@end
