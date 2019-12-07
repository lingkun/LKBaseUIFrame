//
//  BaseDataModel.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseModel.h"
#import "BaseItemModel.h"
#import "BaseHeadModel.h"
#import "BaseFootModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface BaseDataModel : BaseModel

@property (nonatomic,strong)BaseHeadModel *head;
@property (nonatomic,strong)BaseFootModel *foot;

@property (nonatomic,assign)CGSize headSize;
@property (nonatomic,assign)CGSize footSize;

@property (nonatomic,strong)NSMutableArray<BaseItemModel *> *items;
@end

NS_ASSUME_NONNULL_END
