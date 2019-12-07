//
//  BaseCollectionReusableView.m
//  Metis
//
//  Created by 曾凌坤 on 2019/9/26.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseCollectionReusableView.h"


@interface BaseCollectionReusableView()
@end


@implementation BaseCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.label.frame =CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:self.label];
    }
    return self;
}
- (void)setHead:(BaseHeadModel *)head{
    _head =head;
    [self initData];
}
- (void)initData{

}
- (UILabel *)label{
    if (!_label) {
        _label =[[UILabel alloc]init];
    }
    return _label;
}
@end
