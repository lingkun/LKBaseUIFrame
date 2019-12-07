//
//  BaseTableViewCell.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/22.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseTableViewCell.h"
@interface BaseTableViewCell()
@property (nonatomic,strong)UILabel *label;
@end

@implementation BaseTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.label.frame =CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)setModel:(BaseItemModel *)model{
    _model =model;
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
