//
//  BaseCollectionView.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionViewLayout.h"

typedef void(^itemClickBlock)(NSIndexPath * _Nonnull indexPath);
typedef void(^headDataBlock)(void);
typedef void(^footDataBlock)(void);
NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,copy)itemClickBlock clickBlock;
@property (nonatomic,copy)headDataBlock  queryHeadBlock;
@property (nonatomic,copy)footDataBlock  queryFootBlock;


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(BaseCollectionViewLayout *)layout;
- (void)setRefresh;
@end

NS_ASSUME_NONNULL_END
