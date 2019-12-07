//
//  BaseTableFootView.h
//  Metis
//
//  Created by 曾凌坤 on 2019/11/12.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BaseFootModel;
typedef void(^footBlock)(id item);


@interface BaseTableFootView : UITableViewHeaderFooterView
@property (nonatomic,strong)BaseFootModel *foot;
- (void)initUI;
@end

NS_ASSUME_NONNULL_END
