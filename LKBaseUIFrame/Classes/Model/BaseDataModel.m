//
//  BaseDataModel.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseDataModel.h"

@implementation BaseDataModel
- (NSMutableArray<BaseItemModel *> *)items{
    if (!_items) {
        _items =[[NSMutableArray alloc]initWithCapacity:1];
    }
    return _items;
}
- (CGSize)headSize{
    if (CGSizeEqualToSize(CGSizeZero, _headSize)) {
        _headSize =CGSizeMake(ScreenW-20, 60);
    }
    return _headSize;
}
- (CGSize)footSize{
    if (CGSizeEqualToSize(CGSizeZero, _footSize)) {
        _footSize =CGSizeMake(ScreenW-20, 30);
    }
    return _footSize;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end
