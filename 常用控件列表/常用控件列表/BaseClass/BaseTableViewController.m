//
//  BaseTableViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/21.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseTableViewCell.h"

static NSString *const kModuleCellIdentifier = @"kModuleCellIdentifier";

@interface BaseTableViewController ()
@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BaseTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kModuleCellIdentifier];
    _titleModuleArray = [NSMutableArray new];
    _subControllerNameModuleArray = [NSMutableArray new];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_titleModuleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kModuleCellIdentifier forIndexPath:indexPath];
    [cell.instructionLab setText:[_titleModuleArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = [_subControllerNameModuleArray objectAtIndex:indexPath.row];
    Class class = NSClassFromString(className);
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
