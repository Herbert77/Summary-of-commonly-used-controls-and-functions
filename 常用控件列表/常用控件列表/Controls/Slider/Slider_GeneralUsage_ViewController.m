//
//  Slider_GeneralUsage_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2021/1/29.
//  Copyright © 2021 Herbert Hu. All rights reserved.
//

#import "Slider_GeneralUsage_ViewController.h"

@interface Slider_GeneralUsage_ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@end

@implementation Slider_GeneralUsage_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    _slider.minimumValue = 8;
    _slider.maximumValue = 30;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)sliderAction:(id)sender {
    
    uint iValue = round(((UISlider*)sender).value);
    NSLog(@"sliderValue: %i", iValue);
}

@end
