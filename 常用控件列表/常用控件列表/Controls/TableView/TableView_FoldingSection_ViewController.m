//
//  TableView_FoldingSection_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/19.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import "TableView_FoldingSection_ViewController.h"
#import "SectionHeader.h"
@interface TableView_FoldingSection_ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) SectionHeader *header;
@property (assign, nonatomic) BOOL fold;
@end

@implementation TableView_FoldingSection_ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 8, 0, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.allowsSelection = NO;
        _tableView.backgroundColor = [UIColor whiteColor];
        CGRect frame = CGRectMake(0, 0, 0, CGFLOAT_MIN);
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:frame];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        if (self.fold) {
            return 0;
        }
        else {
            return 2;
        }
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    // cell = [tableView dequeueReusableCellWithIdentifier:@"kxx"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
        // cell = [[[NSBundle mainBundle] loadNibNamed:@"HCY_FaceMineCell" owner:self options:nil] objectAtIndex:0];
    }
    [cell.textLabel setText:@"textLabel"];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        self.header = [[[NSBundle mainBundle] loadNibNamed:@"SectionHeader" owner:nil options:nil] lastObject];
        __weak typeof(self) weakSelf = self;
        self.header.sectionHeaderBlock = ^{
            weakSelf.fold = !weakSelf.fold;
            NSIndexSet *idxSet = [[NSIndexSet alloc] initWithIndex:0];
            [weakSelf.tableView reloadSections:idxSet withRowAnimation:UITableViewRowAnimationFade];
        };
        return self.header;
    }
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 30;
    }
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45;
}

@end
