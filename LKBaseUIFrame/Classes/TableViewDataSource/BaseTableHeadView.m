//
//  BaseTableHeadView.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/27.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseTableHeadView.h"

@implementation BaseTableHeadView
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
       
    }
    return self;
}
- (void)initUI{
    
}
- (void)setHead:(BaseHeadModel *)head{
    _head =head;
     [self initUI];
}
@end
