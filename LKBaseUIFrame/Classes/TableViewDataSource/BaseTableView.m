//
//  BaseTableView.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/22.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseTableView.h"
#import "BaseTableHeadView.h"
#import <MJRefresh/MJRefresh.h>

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self =[super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor =[UIColor whiteColor];
        self.delegate =self;
        [self setupHeadRefresh];
        [self setupFootRefresh];
    }
    return self;
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
    if (self.headBlock) {
        self.headBlock();
    }
}
- (void)getFootData{
    if (self.footBlock) {
        self.footBlock();
    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.clickBlock) {
        self.clickBlock(indexPath);
    }
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{  // custom view for header. will be adjusted to default or specified header height
    UITableViewHeaderFooterView *view =nil;
    BaseTableHeadView *head =[tableView dequeueReusableHeaderFooterViewWithIdentifier:[NSString stringWithFormat:@"%@_%ld",self.headIdentifier,section]];
    if (self.itemBlock) {
         head.itemBlock   = self.itemBlock;
    }
   
    view =head;
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseDataModel *datas =[[self dataModel] objectAtIndex:indexPath.section];
    return [datas.items objectAtIndex:indexPath.row].itemSize.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    BaseDataModel *datas =[[self dataModel] objectAtIndex:section];
    if (datas.head) {
        return datas.head.headSize.height;
    } else {
        return datas.headSize.height;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    BaseDataModel *datas =[[self dataModel] objectAtIndex:section];
    if (datas.foot) {
        return datas.foot.footSize.height;
    } else {
        return datas.footSize.height;
    }
}
- (NSArray<BaseDataModel *> *)dataModel{
    BaseTableViewDataSource *dataSource =(BaseTableViewDataSource *)self.dataSource;
    return dataSource.datas;
}

@end
