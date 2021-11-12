//
//  TableView_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/19.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import "TableView_ViewController.h"
#import "TableView_FoldingSection_ViewController.h"

@interface TableView_ViewController ()

@end

@implementation TableView_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom configuration
    [self.titleModuleArray addObject:@" TableView 的section折叠功能"];
    [self.subControllerNameModuleArray addObject:NSStringFromClass([TableView_FoldingSection_ViewController class])];
}

@end
