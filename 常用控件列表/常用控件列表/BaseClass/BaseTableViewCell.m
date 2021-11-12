//
//  BaseTableViewCell.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/1/23.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "FLAnimatedImage.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL fileURLWithPath:@"/Users/herbert/Documents/Github/Summary-of-commonly-used-controls-and-functions/常用控件列表/常用控件列表/abc.gif"]]];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    imageView.frame = CGRectMake(0.0, 0.0, 80.0, 79.0);
    [self.gifView addSubview:imageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
