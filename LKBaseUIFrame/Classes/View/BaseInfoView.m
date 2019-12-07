//
//  BaseInfoView.m
//  Metis
//
//  Created by 曾凌坤 on 2019/9/24.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseInfoView.h"

@interface BaseInfoView ()



@end

@implementation BaseInfoView

- (void)seletedBtnClick:(UIButton *)sender{

}
- (void)norBtnClick:(UIButton *)sender{

}

- (void)setTitle:(NSString *)title{
    _title =title;
    self.titleLabel.text =title;
    CGFloat viewWidth =self.frame.size.width/3.;
    CGFloat viewHeight =self.frame.size.height;
    
    self.titleLabel.frame =CGRectMake(0, (viewHeight-20)/2., viewWidth, viewHeight);
    self.seletedBtn.frame =CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+10, (viewHeight-20)/2., 25, viewHeight);
    self.seletedLabel.frame=CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+10+25+15, (viewHeight-20)/2., viewWidth-15, viewHeight);
    self.norBtn.frame =CGRectMake(2*viewWidth, (viewHeight-20)/2., 25, viewHeight);
    self.norLabel.frame=CGRectMake(2*viewWidth+40, (viewHeight-20)/2., viewWidth-15, viewHeight);
}

- (void)setBtnSelectedTitle:(NSString *)btnSelectedTitle{
    _btnSelectedTitle =btnSelectedTitle;
    [self.seletedBtn setTitle:btnSelectedTitle forState:UIControlStateNormal];
    [self.seletedBtn setTitle:btnSelectedTitle forState:UIControlStateSelected];
}

- (void)setBtnNorTitle:(NSString *)btnNorTitle{
    _btnNorTitle =btnNorTitle;
    [self.norBtn setTitle:btnNorTitle forState:UIControlStateNormal];
    [self.norBtn setTitle:btnNorTitle forState:UIControlStateSelected];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectZero];
        label.textAlignment =NSTextAlignmentRight;
        label.font =[UIFont systemFontOfSize:14];
        label.textColor =rgba(255, 255, 255, 1);
        [self addSubview:label];
        _titleLabel =label;
    }
    return _titleLabel;
}
- (UIButton *)seletedBtn{
    if (!_seletedBtn) {
        
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.imageView.backgroundColor =rgba(89, 89, 91, 1);
//        btn.imageView.frame =CGRectMake(0, 0, 15, 15);
        [btn setImage:[UIImage imageNamedByString:@"selected_nor"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamedByString:@"selected"] forState:UIControlStateSelected];
//        btn.imageView.frame =CGRectMake(0, 0, btn.currentImage.size.width+10, btn.currentImage.size.height);
        btn.imageView.layer.cornerRadius=4;
        btn.imageView.layer.masksToBounds=YES;
        btn.titleLabel.font=[UIFont systemFontOfSize:12];
//        btn.imageView.contentMode =UIViewContentModeScaleAspectFit;
//        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
//        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, btn.currentImage.size.width+5, 0, 0)];
        [btn addTarget:self action:@selector(seletedBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        _seletedBtn =btn;
    }
    return _seletedBtn;
}
- (UILabel *)seletedLabel{
    if (!_seletedLabel) {
        
        _seletedLabel =[[UILabel alloc]initWithFrame:CGRectZero];
        _seletedLabel.font =[UIFont systemFontOfSize:12];
        _seletedLabel.textColor=[UIColor whiteColor];
        [self addSubview:_seletedLabel];
    }
    return _seletedLabel;
}
- (UIButton *)norBtn{
    if (!_norBtn) {
        
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.imageView.backgroundColor =rgba(89, 89, 91, 1);
//        btn.imageView.frame =CGRectMake(0, 0, 15, 15);
        [btn setImage:[UIImage imageNamedByString:@"selected_nor"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamedByString:@"selected"] forState:UIControlStateSelected];
//        btn.imageView.frame =CGRectMake(0, 0, btn.currentImage.size.width+10, btn.currentImage.size.height);
        btn.imageView.layer.cornerRadius=4;
        btn.imageView.layer.masksToBounds=YES;
        btn.titleLabel.font=[UIFont systemFontOfSize:12];
//        btn.imageView.contentMode =UIViewContentModeScaleAspectFit;
//        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
//        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, btn.currentImage.size.width+5, 0, 0)];
        [btn addTarget:self action:@selector(norBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        _norBtn =btn;
    }
    return _norBtn;
}
- (UILabel *)norLabel{
    if (!_norLabel) {
        
        _norLabel =[[UILabel alloc]initWithFrame:CGRectZero];
        _norLabel.font =[UIFont systemFontOfSize:12];
        _norLabel.textColor=[UIColor whiteColor];
        [self addSubview:_norLabel];
    }
    return _norLabel;
}
@end
