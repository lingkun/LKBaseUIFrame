//
//  BaseCollectionDataSource.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseCollectionDataSource.h"
#import "BaseCollectionViewCell.h"

@implementation BaseCollectionDataSource

- (NSString *)identifierBy:(NSIndexPath *)indexPath{
    return self.identifiers[indexPath.section];
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if (self.identifiers.count!=0) {
        
        BaseCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:[self identifierBy:indexPath] forIndexPath:indexPath];
        id item =[[self.datas objectAtIndex:indexPath.section].items objectAtIndex:indexPath.item];
//        YYLog(@"%@",item);
        self.configureCellBlock(cell, item);
        return cell;
    } else {
        BaseCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:self.identifier forIndexPath:indexPath];
        id item =[[self.datas objectAtIndex:indexPath.section].items objectAtIndex:indexPath.item];
        self.configureCellBlock(cell, item);
        return cell;
    }
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    [collectionView.collectionViewLayout invalidateLayout];
    return self.datas.count;
}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   return  [[self.datas objectAtIndex:section].items count];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *view ;
    return view;
}

@end
