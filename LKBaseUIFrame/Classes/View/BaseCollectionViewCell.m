//
//  BaseCollectionViewCell.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface BaseCollectionViewCell()
@property (nonatomic,strong)UILabel *label;
@end

@implementation BaseCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}
- (void)setModel:(BaseItemModel *)model{
    _model =model;
    self.label.frame =CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    [self.contentView addSubview:self.label];
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
