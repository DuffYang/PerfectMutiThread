//
//  DZMultithreadingViewController.m
//  DZStudy
//
//  Created by 杨东正 on 2017/3/23.
//  Copyright © 2017年 Dong Zheng Tech. All rights reserved.
//

#import "DZMultithreadingViewController.h"
#import "DZBaseViewModel.h"

@interface DZMultithreadingViewController ()

@end

@implementation DZMultithreadingViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray *titles = @[@"NSThread", @"GCD", @"NSOperation"];
        NSArray *controllers = @[@"NSThreadLoadViewController", @"GCDLoadViewController", @"NSOperationLoadViewController"];
        NSMutableArray *dataArray = [NSMutableArray array];
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DZBaseViewModel *model = [DZBaseViewModel new];
            model.title = obj;
            model.controllerName = controllers[idx];
            [dataArray addObject:model];
        }];
        self.dataSource = dataArray;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Runtime";
}

@end
