//
//  AvailableMemory_ViewController.m
//  常用控件列表
//
//  Created by Herbert Hu on 2019/2/18.
//  Copyright © 2019年 Herbert Hu. All rights reserved.
//

#import "AvailableMemory_ViewController.h"
#import <sys/sysctl.h>
#import <mach/mach.h>

@interface AvailableMemory_ViewController ()

@end

@implementation AvailableMemory_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"availableMemory : %f", [self availableMemory]);
    NSLog(@"usedMemory : %f", [self usedMemory]);
}

// 获取当前设备可用内存（单位：MB）
- (double)availableMemory {
    
    vm_statistics_data_t vmStats;
    
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    return ((vm_page_size *vmStats.free_count) / 1024.0) / 1024.0;
}

// 获取当前任务所占用的内存（单位：MB）
- (double)usedMemory {
    
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&taskInfo, &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return (taskInfo.resident_size / 1024.0 / 1024.0);
}

@end
