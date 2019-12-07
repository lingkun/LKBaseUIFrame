//
//  BaseItemModel.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseItemModel.h"

@implementation BaseItemModel
- (CGSize)itemSize{
    if (CGSizeEqualToSize(CGSizeZero, _itemSize)) {
        _itemSize =CGSizeMake(ScreenW-20, 60);
    }
    return _itemSize;
}
@end
