//
//  BaseCollectionViewLayout.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseCollectionViewLayout.h"

@implementation BaseCollectionViewLayout
- (instancetype)init{
    self =[super init];
    if (self) {
        
        
        [self initItemSize];
        
    }
    return self;
}
- (void)initItemSize{
    
    /**
     方向
     */
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    /**
     设置item的行间距和列间距
     */
    self.minimumInteritemSpacing = 1.f;
    self.minimumLineSpacing = 1.f;
    
    
    /*
     设置每个分区的上左下右的内边距
     */
    self.sectionInset = UIEdgeInsetsMake(1,1,1,1);
    /**
     设置区头和区尾的大小
     */
    self.headerReferenceSize = CGSizeMake(ScreenW, 10);
    self.footerReferenceSize = CGSizeMake(ScreenW, 10);
    /**
     设置分区的头视图和尾视图是否始终固定在屏幕上边和下边
     */
    self.sectionFootersPinToVisibleBounds = NO;
    self.sectionHeadersPinToVisibleBounds = NO;
    
    //        /**
    //         设置item的大小
    //         */
    CGFloat itemW = 200.f;
    self.itemSize = CGSizeMake(itemW, itemW);
}

@end
