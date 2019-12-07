//
//  BaseTableView.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/22.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseTableViewDataSource.h"

typedef void(^itemClickBlock)(NSIndexPath * _Nonnull indexPath);
typedef void(^headDataBlock)(void);
typedef void(^footDataBlock)(void);

typedef void(^headItemBlock)(id _Nullable item);

typedef void(^deleteItemBlock)(NSIndexPath *_Nonnull indexPath);

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableView : UITableView<UITableViewDelegate>
@property (nonatomic,copy)NSString *headIdentifier;
@property (nonatomic,copy)NSString *footIdentifier;
@property (nonatomic,copy)itemClickBlock clickBlock;
@property (nonatomic,copy)headDataBlock  headBlock;
@property (nonatomic,copy)footDataBlock  footBlock;
@property (nonatomic,copy)headItemBlock  itemBlock;
@property (nonatomic,copy)deleteItemBlock  deleteBlock;


@end

NS_ASSUME_NONNULL_END
