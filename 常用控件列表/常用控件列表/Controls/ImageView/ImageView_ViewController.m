//
//  ImageView_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2018/1/30.
//  Copyright © 2018年 Herbert Hu. All rights reserved.
//

#import "ImageView_ViewController.h"

@interface ImageView_ViewController ()
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation ImageView_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.imageView];
}

#pragma mark - Getter
- (UIImageView *)imageView {
    
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [_imageView setFrame:CGRectMake(100, 100, 200, 200)];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
        [_imageView setUserInteractionEnabled:NO];
        [_imageView setAlpha:1.0];
        [_imageView setHidden:NO];
        [_imageView setImage:[UIImage imageNamed:@"Ass"]];
        [_imageView setHighlightedImage:[UIImage imageNamed:@"Ass"]];
        [_imageView sizeToFit];
    }
    return _imageView;
}

@end
