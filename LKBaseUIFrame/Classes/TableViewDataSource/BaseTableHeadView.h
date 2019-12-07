//
//  BaseTableHeadView.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/27.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BaseHeadModel;
typedef void(^headBlock)(id item);

@interface BaseTableHeadView : UITableViewHeaderFooterView
@property (nonatomic,strong)BaseHeadModel *head;

@property (nonatomic,copy)headBlock itemBlock;

- (void)initUI;
@end

NS_ASSUME_NONNULL_END
