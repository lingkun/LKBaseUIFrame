//
//  BaseDataSource.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/22.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseDataSource.h"

@implementation BaseDataSource
- (instancetype)init {
    return  nil;
}
- (id)initWithDatas:(NSArray *)datas withIdentifier:(NSString *)identifier configureCellBlock:(nonnull cellConfigureBlock)aConfigureCellBlock{
    
    self =[super init];
    if (self) {
        [self.datas addObjectsFromArray:datas];
        self.identifier =identifier;
        self.configureCellBlock = aConfigureCellBlock;
    }
    return self;
}
- (id)initWithDatas:(NSArray *)datas withIdentifiers:(nonnull NSArray<NSString *> *)identifiers configureCellBlock:(nonnull cellConfigureBlock)aConfigureCellBlock{
    
    self =[super init];
    if (self) {
        [self.datas removeAllObjects];
        [self.datas addObjectsFromArray:datas];
        self.identifiers =[[NSMutableArray alloc]initWithArray:identifiers];
        self.configureCellBlock = aConfigureCellBlock;
    }
    return self;
}
- (id)initWithDatas:(NSArray *)datas withIdentifiers:(NSArray<NSString *> *)identifiers configureCellBlock:(cellConfigureBlock)aConfigureCellBlock configureHeadBlock:(cellConfigureBlock)aConfigureHealBlock{
    self =[super init];
    if (self) {
        [self.datas removeAllObjects];
        [self.datas addObjectsFromArray:datas];
        self.identifiers =[[NSMutableArray alloc]initWithArray:identifiers];
        self.configureCellBlock = aConfigureCellBlock;
        self.configureHeadBlock = aConfigureHealBlock;
    }
    return self;
}
- (NSMutableArray<BaseDataModel *> *)datas{
    if (!_datas) {
        _datas =[[NSMutableArray alloc]initWithCapacity:1];
    }
    return _datas;
}

@end
