//
//  AlarmView.m
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/15.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import "AlarmView.h"
#import "Masonry.h"

@interface AlarmView ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@end

@implementation AlarmView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupXib];
        [self customProperties];
    }
    return self;
}

- (void)setupXib {
    
    [[NSBundle mainBundle] loadNibNamed:@"AlarmView" owner:self options:nil];
    [self addSubview:self.contentView];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [[self.contentView layer] setMasksToBounds:YES];
    [[self.contentView layer] setCornerRadius:3];
}

- (void)customProperties {
    
    [self setBackgroundColor:[UIColor lightGrayColor]];
}

- (IBAction)leftBtnAction:(id)sender {
    
    if (self.actionBlock) {
        self.actionBlock(-1);
    }
}

- (IBAction)rightBtnAction:(id)sender {
    if (self.actionBlock) {
        self.actionBlock(1);
    }
}

@end
