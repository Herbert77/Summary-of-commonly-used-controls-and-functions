//
//  NSPredicate_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/2/26.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "NSPredicate_ViewController.h"
#import "Person.h"
@interface NSPredicate_ViewController ()

@end

@implementation NSPredicate_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *objArr = [[NSArray alloc] initWithObjects:
                       [Person personWithName:@"Amy" age:9],
                       [Person personWithName:@"Lisa" age:21],
                       [Person personWithName:@"Cook" age:18],
                       [Person personWithName:@"Alice" age:12],
                       nil];
    
    // 谓词逻辑约束对象
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age>12"];
    // 筛选结果
    NSArray *resultArr = [objArr filteredArrayUsingPredicate:predicate];
    
    for (Person *temp in resultArr) {
        NSLog(@"%@", temp.description);
    }

    /*
    NSPredicate *predicate0 = [NSPredicate predicateWithFormat:@"name IN {Amy, Cook}"];
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"age>10 && age<20"];
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"name CONTAINS 'a'"];
    // like 正则匹配， ？表示一个占位符，* 表示任意匹配
    NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"name like '??y'"];
    NSPredicate *predicate4 = [NSPredicate predicateWithFormat:@"name like '*a*'"];
    */
}

@end
