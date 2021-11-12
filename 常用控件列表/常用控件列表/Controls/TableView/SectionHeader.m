//
//  SectionHeader.m
//  常用控件列表
//
//  Created by Herbert Hu on 2020/6/19.
//  Copyright © 2020 Herbert Hu. All rights reserved.
//

#import "SectionHeader.h"

@implementation SectionHeader

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tapGr];
}

- (void)tapAction {
    if (self.sectionHeaderBlock) {
        self.sectionHeaderBlock();
    }
}


@end
