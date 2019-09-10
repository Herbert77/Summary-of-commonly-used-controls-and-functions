//
//  CG_Demo2_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/8/30.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "CG_Demo2_ViewController.h"
#import "CG_WaveView.h"

@interface CG_Demo2_ViewController ()
@property (strong, nonatomic) CG_WaveView *waveView;
@end

@implementation CG_Demo2_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.waveView = [CG_WaveView loadingView];
    self.waveView.center = self.view.center;
    [self.view addSubview:self.waveView];
    
    [self.waveView startLoading];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
