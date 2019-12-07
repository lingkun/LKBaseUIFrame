//
//  BasePopController.m
//  Metis
//
//  Created by 曾凌坤 on 2019/9/26.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BasePopController.h"


#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width


#if __IPHONE_OS_VERSION_MAX_ALLOWED < 100000
// CAAnimationDelegate is not available before iOS 10 SDK
@interface BasePopController ()<UIGestureRecognizerDelegate>
#else
@interface BasePopController () <CAAnimationDelegate,UIGestureRecognizerDelegate>
#endif

@end

@implementation BasePopController
#pragma mark =========================方法======================================
+ (instancetype)showData:(NSDictionary *)data
{
    BasePopController *redPacketView = [[self alloc]initShowData:(NSDictionary *)data];
    return redPacketView;
}
+ (instancetype)showData:(NSDictionary *)data
             finishBlock:(callBack)finishBlock
{
    BasePopController *redPacketView = [[self alloc]initShowData:(NSDictionary *)data 
                                                     finishBlock:finishBlock];
    return redPacketView;
}

+ (instancetype)showData:(NSDictionary *)data PopByCancelBlock:(LKCancelBlock)cancelBlock
             finishBlock:(callBack)finishBlock
{
    BasePopController *redPacketView = [[self alloc]initShowData:(NSDictionary *)data PopByCancelBlock:cancelBlock
                                                  finishBlock:finishBlock];
    return redPacketView;
}
- (void)showData:(NSDictionary *)data PopByCancelBlock:(LKCancelBlock)cancelBlock
     finishBlock:(callBack)finishBlock{
    
  
    _data =data;

    self.cancelBlock = cancelBlock;
    self.block = finishBlock;
    
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeViewAction)];
//    tapGesture.delegate = self;
//    [self.view addGestureRecognizer:tapGesture];
}

#pragma mark =========================代理======================================
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
       shouldReceiveTouch:(UITouch *)touch {
    
    if ([_backgroundImageView pointInside:[touch locationInView:_backgroundImageView] withEvent:nil]) {
        //        [self pushVCWithClassName:@"MeVipController"];
        [self closeViewAction];
        if (self.block) {
            self.block(@{});
        }
        return NO;
    }
    
    return (![_backgroundImageView pointInside:[touch locationInView:_backgroundImageView] withEvent:nil]);
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self closeViewAction];
}
#pragma mark =========================重载======================================
#pragma mark =========================第三方=====================================
#pragma mark =========================懒加载=====================================
#pragma mark =========================UI=======================================
#pragma mark =========================sysytem===================================
- (instancetype)init{
    self=[super init];
    if (self) {
        [self.alertWindow addSubview:self.view];
        [self.alertWindow addSubview:[self bgVIEW]];
       
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeViewAction)];
        tapGesture.delegate = self;
        [self.view addGestureRecognizer:tapGesture];
    }
    return self;
}
- (instancetype)initShowData:(NSDictionary *)data
{
    
    self =[super init];
    
    if (self) {
        _data =data;
        [self.alertWindow addSubview:self.view];
        [self.alertWindow addSubview:[self bgVIEW]];
        
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeViewAction)];
        tapGesture.delegate = self;
        [self.view addGestureRecognizer:tapGesture];
        
    }
    return self;
}
- (instancetype)initShowData:(NSDictionary *)data
                 finishBlock:(callBack)finishBlock
{
    
    self =[super init];
    
    if (self) {
        _data =data;
        [self.alertWindow addSubview:self.view];
        [self.alertWindow addSubview:[self bgVIEW]];
        
        self.block = finishBlock;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeViewAction)];
        tapGesture.delegate = self;
        [self.view addGestureRecognizer:tapGesture];
        
    }
    return self;
}
- (instancetype)initShowData:(NSDictionary *)data PopByCancelBlock:(LKCancelBlock)cancelBlock
                 finishBlock:(callBack)finishBlock
{
    
    self =[super init];
    
    if (self) {
        _data =data;
        [self.alertWindow addSubview:self.view];
        [self.alertWindow addSubview:[self bgVIEW]];
        
        self.cancelBlock = cancelBlock;
        self.block = finishBlock;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeViewAction)];
        tapGesture.delegate = self;
        [self.view addGestureRecognizer:tapGesture];
        
    }
    return self;
}
- (UIView *)bgVIEW{
    return self.backgroundImageView;
}
- (UIView *)backgroundImageView
{
    if (!_backgroundImageView) {
        
        //        CGFloat width = ScreenWidth - 50 * ViewScaleIphone5Value;
        CGFloat width =ViewWidth;// ScreenWidth - 50 * ViewScaleIphone5Value;
        CGFloat height = [self bgHight];
        _backgroundImageView = [[UIView alloc] initWithFrame:CGRectMake(25 * ViewScaleIphone5Value, ScreenHeight / 2 - height / 2, width, height)];
        _backgroundImageView.backgroundColor =[UIColor WhileBackgroundColor];
        _backgroundImageView.layer.cornerRadius =2;
        _backgroundImageView.layer.masksToBounds =YES;
        _backgroundImageView.transform = CGAffineTransformMakeScale(0.05, 0.05);
        
        [UIView animateWithDuration:.15
                         animations:^{
                             self.backgroundImageView.transform = CGAffineTransformMakeScale(1.05, 1.05);
                         }completion:^(BOOL finish){
                             [UIView animateWithDuration:.15
                                              animations:^{
                                                  self.backgroundImageView.transform = CGAffineTransformMakeScale(0.95, 0.95);
                                              }completion:^(BOOL finish){
                                                  [UIView animateWithDuration:.15
                                                                   animations:^{
                                                                       self.backgroundImageView.transform = CGAffineTransformMakeScale(1, 1);
                                                                   }];
                                              }];
                         }];
    }
    return _backgroundImageView;
}
- (CGFloat)bgHight{
    return 150;
}
- (UIWindow *)alertWindow
{
    if (!_alertWindow) {
        _alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _alertWindow.windowLevel = UIWindowLevelAlert;
        _alertWindow.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        [_alertWindow makeKeyAndVisible];
        _alertWindow.rootViewController = self;
    }
    return _alertWindow;
}
- (void)closeViewAction{
    
    [UIView animateWithDuration:.2 animations:^{
        self.backgroundImageView.transform = CGAffineTransformMakeScale(0.2, 0.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.08
                         animations:^{
                             self.backgroundImageView.transform = CGAffineTransformMakeScale(0.25, 0.25);
                         }completion:^(BOOL finish){
                             [self.alertWindow removeFromSuperview];
                             self.alertWindow.rootViewController = nil;
                             self.alertWindow = nil;
                             
                             if (self.cancelBlock) {
                                 self.cancelBlock();
                             }
                         }];
    }];
}
- (CAKeyframeAnimation *)confirmViewRotateInfo
{
    CAKeyframeAnimation *theAnimation = [CAKeyframeAnimation animation];
    
    theAnimation.values = [NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0.5, 0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(3.13, 0, 0.5, 0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(6.28, 0, 0.5, 0)],
                           nil];
    
    
    theAnimation.cumulative = YES;
    theAnimation.duration = .4;
    theAnimation.repeatCount = 3;
    theAnimation.removedOnCompletion = YES;
    theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.delegate = self;
    
    return theAnimation;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden =YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden =NO;
}

@end
