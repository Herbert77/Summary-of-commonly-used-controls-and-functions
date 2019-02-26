//
//  AvailableMemory_ViewController.h
//  常用控件列表
//
//  Created by Herbert Hu on 2019/2/18.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AvailableMemory_ViewController : BaseViewController {
    
    @private
        NSString *privateStr;
    
    @protected
        NSString *protectedStr;
    
    @public
        NSString *publicStr;
    
    @package
        NSString *packageStr;
}

@end

NS_ASSUME_NONNULL_END
