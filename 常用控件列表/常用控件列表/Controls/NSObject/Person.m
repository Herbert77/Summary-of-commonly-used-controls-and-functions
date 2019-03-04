//
//  Person.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/2/26.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (Person *)personWithName:(NSString *)name age:(NSInteger)age {
    
    Person *temp = [[Person alloc] init];
    temp.name = name;
    temp.age = age;
    return temp;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@ , age: %li", self.name, (long)self.age];
}

@end
