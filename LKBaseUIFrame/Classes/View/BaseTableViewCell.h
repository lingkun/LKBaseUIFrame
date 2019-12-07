//
//  BaseTableViewCell.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/22.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BaseItemModel;

@interface BaseTableViewCell : UITableViewCell
@property (nonatomic,strong)BaseItemModel *model;
- (void)initData;
@end

NS_ASSUME_NONNULL_END
