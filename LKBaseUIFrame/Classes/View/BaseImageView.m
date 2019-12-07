//
//  BaseImageView.m
//  Metis
//
//  Created by 曾凌坤 on 2019/9/27.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseImageView.h"

@interface BaseImageView ()

@end

@implementation BaseImageView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor =rgba(75, 75, 75, 1);
//        self.clipsToBounds = YES;
//        self.contentMode = UIViewContentModeScaleAspectFit;

        self.nameLabel.frame =CGRectMake(0, frame.size.height-27, frame.size.width, 27);
//        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.right.left.mas_equalTo(0);
//        }];
    }
    return self;
}
- (void)setImageUrl:(NSString *)imageUrl{
    _imageUrl =imageUrl;
    
    @weakify(self);

    [self sd_setImageWithURL:[NSURL URLWithString:imageUrl]  placeholderImage:[UIImage imageNamedByString:@"login_logo"]  options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
//        YYLog(@"总:%ld加载进度:%0.2f->%@",(long)expectedSize,1.0*receivedSize/expectedSize,targetURL.absoluteString);
//        @strongify(self);
//        if (expectedSize==-1) {
//            self.state =PIC_STATE_AI_FAILED;
//            if (self.block) {
//                self.block(PIC_STATE_AI_FAILED, -1);
//            }
//        }
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        @strongify(self);

        if (error) {
            YYLog(@"%@",error.description);
            if (error.code == -1100) {
                YYLog(@"%@",error.description);
            }
            [self setImage:[UIImage imageNamedByString:@"login_logo"]];

            self.state =PIC_STATE_AI_FAILED;
            if (self.block) {
                self.block(PIC_STATE_AI_FAILED,-1);
            }
        }
        else
        {
            [self setImage:image];

            self.state =PIC_STATE_LOAD_SUCCESS;
            if (self.block) {
                self.block(PIC_STATE_LOAD_SUCCESS,1);
            }
        }
    }];
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        UILabel *label =[[UILabel alloc]init];
        label.textAlignment =NSTextAlignmentCenter;
        label.textColor =rgba(200, 200, 200, 1);
        label.font =[UIFont systemFontOfSize:11];
        label.numberOfLines =0;
        [self addSubview:label];
        _nameLabel =label;
    }
    return _nameLabel;
}

@end
