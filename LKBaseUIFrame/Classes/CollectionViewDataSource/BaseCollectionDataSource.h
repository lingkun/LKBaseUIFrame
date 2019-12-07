//
//  BaseCollectionDataSource.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDataSource.h"


NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionDataSource : BaseDataSource<UICollectionViewDataSource>

- (NSString *)identifierBy:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
