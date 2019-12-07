//
//  BaseController.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/26.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

#pragma mark =========================方法======================================
- (void)getData{
    
}
#pragma mark =========================代理======================================
#pragma mark =========================重载======================================
#pragma mark =========================第三方=====================================
#pragma mark =========================懒加载=====================================

#pragma mark =========================UI=======================================
- (void)initUI{
    YYLog(@"OK");
}

#pragma mark =========================sysytem===================================

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD dismiss];
    [self initUI];
//    [self getData];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self  getData];
}
- (void)dealloc{
    YYLog(@"dealoc ->%@",self.className)
}
@end
