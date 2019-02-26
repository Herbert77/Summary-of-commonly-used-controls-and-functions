//
//  ListModuleController.m
//  
//
//  Created by Herbert Hu on 2018/1/9.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "ListModuleController.h"
#import "Button_ViewController.h"
#import "ImageView_ViewController.h"
#import "Label_ViewController.h"
#import "TextField_ViewController.h"
#import "AlertView_ViewController.h"
#import "View_ViewController.h"
#import "RichText_ViewController.h"
#import "ScrollView_ViewController.h"

static NSString *const kModuleCellIdentifier = @"kModuleCellIdentifier";

@interface ListModuleController ()
@property (strong, nonatomic) NSMutableArray *titleModuleArray;
@property (strong, nonatomic) NSMutableArray *subControllerNameModuleArray;
@end

@implementation ListModuleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"List Module";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kModuleCellIdentifier];
    _titleModuleArray = [NSMutableArray new];
    _subControllerNameModuleArray = [NSMutableArray new];
    
    // custom configuration
    [_titleModuleArray addObject:@"UIButton"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([Button_ViewController class])];
    
    [_titleModuleArray addObject:@"UIImageView"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([ImageView_ViewController class])];
    
    [_titleModuleArray addObject:@"UILabel"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([Label_ViewController class])];
    
    [_titleModuleArray addObject:@"UITextField"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([TextField_ViewController class])];
    
    [_titleModuleArray addObject:@"AlertView"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([AlertView_ViewController class])];
    
    [_titleModuleArray addObject:@"View"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([View_ViewController class])];
    
    [_titleModuleArray addObject:@"RichTextEditor"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([RichText_ViewController class])];
    
    [_titleModuleArray addObject:@"ScrollView"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([ScrollView_ViewController class])];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_titleModuleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kModuleCellIdentifier forIndexPath:indexPath];
    [cell.textLabel setText:[_titleModuleArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = [_subControllerNameModuleArray objectAtIndex:indexPath.row];
    Class class = NSClassFromString(className);
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
