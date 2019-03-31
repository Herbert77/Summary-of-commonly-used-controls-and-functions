//
//  CopyIvarList_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/3/27.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "CopyIvarList_ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import "Person+Cate.h"

@interface CopyIvarList_ViewController ()

@end

@implementation CopyIvarList_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *aPerson = [Person new];
    aPerson.name = @"Herbert";
    aPerson.age = 12;
    aPerson.address = @"Wuhan";
    NSLog(@"address: %@", aPerson.address);
    
    unsigned int count = 0;
          
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    Ivar *list = class_copyIvarList([aPerson class], &count);
    for (int i=0; i<count; i++) {
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(list[i])];
        id ivarValue = [aPerson valueForKey:ivarName];
        if (ivarValue) {
            dic[ivarName] = ivarValue;
        }
        else {
            dic[ivarName] = @"";
        }
    }
    
    // print
    for (NSString *ivarName in dic.allKeys) {
        NSLog(@"ivarName:%@, ivarValue:%@", ivarName, dic[ivarName]);
    }
}

@end
