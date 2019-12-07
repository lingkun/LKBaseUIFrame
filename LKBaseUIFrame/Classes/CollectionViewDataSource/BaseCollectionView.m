//
//  BaseCollectionView.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseCollectionView.h"
#import <MJRefresh/MJRefresh.h>

@implementation BaseCollectionView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull BaseCollectionViewLayout *)layout{
    self =[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.delegate =self;
        self.backgroundColor=[UIColor colorWithRGBHex:0xffffff alpha:1];
       
        
        [self setRefresh];
        
    }
    return self;
}
- (void)setRefresh{
    [self setupHeadRefresh];
    [self setupFootRefresh];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (self.clickBlock) {
        self.clickBlock(indexPath);
    }
}
- (void)setupHeadRefresh{
    XUWeakSelf(self);
    //        /** 普通闲置状态 */
    //        MJRefreshStateIdle = 1,
    //        /** 松开就可以进行刷新的状态 */
    //        MJRefreshStatePulling,
    //        /** 正在刷新中的状态 */
    //        MJRefreshStateRefreshing,
    //        /** 即将刷新的状态 */
    //        MJRefreshStateWillRefresh,
    //        /** 所有数据加载完毕，没有更多的数据了 */
    //        MJRefreshStateNoMoreData
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself getHeadData];
        [weakself.mj_header endRefreshing];
    }];
    header.activityIndicatorViewStyle =UIActivityIndicatorViewStyleWhiteLarge;
    header.stateLabel.text =@"";
    [header setTitle:@"" forState:MJRefreshStateIdle];
    [header setTitle:@"" forState:MJRefreshStatePulling];
    [header setTitle:@"" forState:MJRefreshStateRefreshing];
    [header setTitle:@"" forState:MJRefreshStateWillRefresh];
    [header setTitle:@"" forState:MJRefreshStateNoMoreData];
    
    
    self.mj_header =header;
    //自动更改透明度
    self.mj_header.automaticallyChangeAlpha = YES;
}
- (void)setupFootRefresh{
    XUWeakSelf(self);

    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakself getFootData];
        [weakself.mj_footer endRefreshing];
    }];
    footer.stateLabel.text =@"";
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"" forState:MJRefreshStatePulling];
    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"" forState:MJRefreshStateWillRefresh];
    [footer setTitle:@"" forState:MJRefreshStateNoMoreData];
    
    footer.automaticallyChangeAlpha =YES;
    footer.ignoredScrollViewContentInsetBottom =self.contentInset.bottom;
    self.mj_footer =footer;
    
}
- (void)getHeadData{
    if (self.queryHeadBlock) {
        self.queryHeadBlock();
    }
}
- (void)getFootData{
    if (self.queryFootBlock) {
        self.queryFootBlock();
    }
}
@end
