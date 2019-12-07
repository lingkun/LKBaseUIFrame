//
//  BaseTableFootView.m
//  Metis
//
//  Created by 曾凌坤 on 2019/11/12.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseTableFootView.h"

@implementation BaseTableFootView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
       
    }
    return self;
}
- (void)initUI{
    
}
- (void)setFoot:(BaseFootModel *)foot{
    
    _foot =foot;
      [self initUI];
    
}
@end
