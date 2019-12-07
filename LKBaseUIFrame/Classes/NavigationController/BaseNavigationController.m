//
//  BaseNavigationController.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/26.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseNavigationController.h"
#import <YYKit.h>

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor =rgba(52, 52, 52, 1);
//      [self.navigationBar setBackgroundImage:[UIImage imageNamedByString:@"List_bg"] forBarMetrics:UIBarMetricsDefault];
      self.navigationBar.shadowImage=[UIImage new];
      
  //  title
      [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRGBHex:0xFFFFFF], NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName,nil]];
  //  修改按钮的文字颜色
      [self.navigationBar setTintColor:[UIColor colorWithRGBHex:0xFFFFFF]];

      self.navigationBar.translucent =NO;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
      
}
#pragma mark ====================push subviews=====================
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    YYLog(@"当前类名：%@",viewController.className);

    if (![viewController.className isEqualToString:@"PersionalController"]) {
        UIButton *leftBtn = [[UIButton alloc] init];
        
        leftBtn.frame = CGRectMake(0, 7, 30, 30);
        [leftBtn addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"MoremeSDKBundle.bundle/login_return@3x.png"] forState:UIControlStateNormal];

        UIView *view1 = [[UIView alloc] init];
        
        view1.frame =  CGRectMake(0, 20, 60, 60);
        [view1 addSubview:leftBtn];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view1];
        
        UIView *barImageView = self.navigationController.navigationBar.subviews.firstObject;
               barImageView.alpha = 0.0;
    }else{
       
    }
    

//    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"MoremeSDKBundle.bundle/login_return"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick:)];

    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;//隐藏底部tabbar
        if ([viewController isKindOfClass:NSClassFromString(@"MoreCameraVC")]) {
            // 没有滑动返回功能
//             self.interactivePopGestureRecognizer.delegate = self;
        } else {
            // 就有滑动返回功能
            self.interactivePopGestureRecognizer.delegate = nil;
        }
        
    }
//    viewController.title =viewController.className;
    viewController.view.backgroundColor =[UIColor colorWithRGBHex:0x434242];
    [super pushViewController:viewController animated:animated];
}
- (void)backClick:(UIBarButtonItem *)sender{
    
    if (self.childViewControllers.count==1 && [self.childViewControllers.firstObject.className isEqualToString:@"MainController"]) {
        
        [self dismissViewControllerAnimated:YES completion:nil];

    }else{
        
        [self popViewControllerAnimated:YES];

    }
}

// 字体设置为白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
