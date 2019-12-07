//
//  BaseDataSource.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/22.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseDataModel.h"

typedef  void(^cellConfigureBlock)(id  _Nullable cell,id _Nullable items);

NS_ASSUME_NONNULL_BEGIN

@interface BaseDataSource : NSObject
/**
 数组
 */
@property (nonatomic,strong)NSMutableArray<BaseDataModel *> *datas;

/**
 identifier cell标识
 */
@property (nonatomic,copy)NSString *identifier;
@property (nonatomic,strong)NSMutableArray <NSString *> *identifiers;

/**
 cell block
 */
@property (nonatomic,copy)cellConfigureBlock configureCellBlock;

/**
 head block
 */
@property (nonatomic,copy)cellConfigureBlock configureHeadBlock;

/**
 导入外部数据
 
 @param datas 数组
 @param identifier cell 标识
 @return 返回实例
 */
- (id)initWithDatas:(NSArray *)datas withIdentifier:(NSString *)identifier configureCellBlock:(cellConfigureBlock)aConfigureCellBlock;
- (id)initWithDatas:(NSArray *)datas withIdentifiers:(NSArray<NSString*> *)identifiers configureCellBlock:(cellConfigureBlock)aConfigureCellBlock;
- (id)initWithDatas:(NSArray *)datas withIdentifiers:(NSArray<NSString*> *)identifiers configureCellBlock:(cellConfigureBlock)aConfigureCellBlock configureHeadBlock:(cellConfigureBlock)aConfigureHealBlock;


@end

NS_ASSUME_NONNULL_END
