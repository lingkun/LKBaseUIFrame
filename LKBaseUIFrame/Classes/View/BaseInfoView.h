//
//  BaseInfoView.h
//  Metis
//
//  Created by 曾凌坤 on 2019/9/24.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseInfoView : UIView

@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *btnSelectedTitle;
@property (nonatomic,copy)NSString *btnNorTitle;


@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UIButton *seletedBtn;
@property (nonatomic,strong)UIButton *norBtn;

@property (nonatomic,strong)UILabel *seletedLabel;
@property (nonatomic,strong)UILabel *norLabel;

@end

NS_ASSUME_NONNULL_END
