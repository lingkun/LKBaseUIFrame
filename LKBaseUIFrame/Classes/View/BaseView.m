//
//  BaseView.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/22.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor whiteColor];
        [self initUI];
    }
    return self;
}
- (void)setModel:(id)model{
    _model =model;
    
}
- (void)initUI{
    
}
- (void)reloadData{
    
}
@end
