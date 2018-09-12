//
//  ViewController.m
//  PerfectMutiThread
//
//  Created by Yang,Dongzheng on 2018/9/12.
//  Copyright © 2018年 Yang,Dongzheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"多线程";
    
    
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


@end
