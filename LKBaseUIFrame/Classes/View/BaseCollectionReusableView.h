//
//  BaseCollectionReusableView.h
//  Metis
//
//  Created by 曾凌坤 on 2019/9/26.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BaseHeadModel;

@interface BaseCollectionReusableView : UICollectionReusableView
@property (nonatomic,strong)BaseHeadModel *head;
@property (nonatomic,strong)UILabel *label;

- (void)initData;

@end

NS_ASSUME_NONNULL_END
