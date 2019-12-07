//
//  BaseView.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/22.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^queryHeadDataBlock)(void);
typedef void(^queryFootDataBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface BaseView : UIView

@property (nonatomic,copy)queryHeadDataBlock  headBlock;
@property (nonatomic,copy)queryFootDataBlock  footBlock;

@property (nonatomic,strong)id model;

- (void)initUI;
- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
