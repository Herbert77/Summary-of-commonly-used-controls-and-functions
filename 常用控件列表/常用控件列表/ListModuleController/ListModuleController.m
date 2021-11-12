//
//  ListModuleController.m
//  
//
//  Created by Herbert Hu on 2018/1/9.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "ListModuleController.h"
#import "NSObject_ViewController.h"
#import "Button_ViewController.h"
#import "ImageView_ViewController.h"
#import "Label_ViewController.h"
#import "TextField_ViewController.h"
#import "AlertView_ViewController.h"
#import "View_ViewController.h"
#import "RichText_ViewController.h"
#import "ScrollView_ViewController.h"
#import "MultiThreading_ViewController.h"
#import "RAC_ViewController.h"
#import "CoreGraphics_ViewController.h"
#import "BaseTableViewCell.h"
#import "CG_Demo1_ViewController.h"
#import "CollectionView_ViewController.h"
#import "TableView_ViewController.h"
#import "TableView_FoldingSection_ViewController.h"
#import "Bezier_ViewController.h"
#import "Slider_ViewController.h"

#import "BaseTabBarController.h"

static NSString *const kModuleCellIdentifier = @"kModuleCellIdentifier2";

@interface ListModuleController ()
@property (strong, nonatomic) NSMutableArray *titleModuleArray;
@property (strong, nonatomic) NSMutableArray *subControllerNameModuleArray;
@end

@implementation ListModuleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"List Module";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BaseTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kModuleCellIdentifier];
    
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"RushToDesti" style:UIBarButtonItemStyleDone target:self action:@selector(rushToDestiAction)];

    [self.navigationItem setRightBarButtonItem:rightButtonItem];
    
    
    _titleModuleArray = [NSMutableArray new];
    _subControllerNameModuleArray = [NSMutableArray new];
    
    // custom configuration
    [_titleModuleArray addObject:@"NSObject"];
    
//    Class theClass = NSClassFromString(@"NSObject_ViewController");
    
    //[_subControllerNameModuleArray addObject:NSStringFromClass(theClass)];
    
    [_subControllerNameModuleArray addObject:NSStringFromClass([NSObject_ViewController class])];
    
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
    
    [_titleModuleArray addObject:@"MultiThreading"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([MultiThreading_ViewController class])];
    
    [_titleModuleArray addObject:@"ReactiveCocoa"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([RAC_ViewController class])];
    
    [_titleModuleArray addObject:@"CoreGraphics"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([CoreGraphics_ViewController class])];
    
    [_titleModuleArray addObject:@"BaseTabBarController"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([BaseTabBarController class])];
    
    [_titleModuleArray addObject:@"CollectionView"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([CollectionView_ViewController class])];
    
    [_titleModuleArray addObject:@"TableView"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([TableView_ViewController class])];
    
    [_titleModuleArray addObject:@"Bezier"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([Bezier_ViewController class])];
    
    [_titleModuleArray addObject:@"UISlider"];
    [_subControllerNameModuleArray addObject:NSStringFromClass([Slider_ViewController class])];

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

#pragma mark - Action
- (void)rushToDestiAction {
    
    TableView_FoldingSection_ViewController *vc = [[TableView_FoldingSection_ViewController alloc] init];
    vc.x = 2;
    [self.navigationController pushViewController:vc animated:YES];
}

@end



