//
//  BasePopController.h
//  Metis
//
//  Created by 曾凌坤 on 2019/9/26.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseController.h"



NS_ASSUME_NONNULL_BEGIN

typedef void(^LKCancelBlock)(void);
//typedef void(^LKPopBlock)(NSDictionary *data);

#define ViewScaleIphone5Value    ([UIScreen mainScreen].bounds.size.width/320.0f)
#define ViewWidth    (ScreenW - 50*ViewScaleIphone5Value)

@interface BasePopController : BaseController

@property (nonatomic,strong) UIWindow       *alertWindow;

@property (nonatomic,strong) UIView    *backgroundImageView;

@property (nonatomic,copy) LKCancelBlock    cancelBlock;
//@property (nonatomic,copy) LKPopBlock    finishBlock;

@property (nonatomic,strong)NSDictionary *data;

+ (instancetype)showData:(NSDictionary *)data PopByCancelBlock:(LKCancelBlock)cancelBlock
             finishBlock:(callBack)finishBlock;
+ (instancetype)showData:(NSDictionary *)data;
+ (instancetype)showData:(NSDictionary *)data
             finishBlock:(callBack)finishBlock;

- (void)showData:(NSDictionary *)data PopByCancelBlock:(LKCancelBlock)cancelBlock
                 finishBlock:(callBack)finishBlock;
- (void)closeViewAction;
- (UIView *)bgVIEW;

@end

NS_ASSUME_NONNULL_END
