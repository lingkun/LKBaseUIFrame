//
//  BaseViewModel.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/26.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseView.h"
#import "HTTPSession.h"
#import <SVProgressHUD.h>

typedef void(^resultBlock)(id _Nullable  data);

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewModel : NSObject

@property (nonatomic,strong)BaseView *bgView;
@property (nonatomic,copy)resultBlock resultData;

@property (nonatomic,assign)NSInteger pageSize;
@property (nonatomic,assign)NSInteger pageNo;

@property (nonatomic,strong)HTTPSession *session;

/**
 init

 @param view 需要显示的页面
 @return self
 */
- (instancetype)initWithView:(BaseView *)view;



- (void)queryDataByRefreshView:(id)view;



@end

NS_ASSUME_NONNULL_END
