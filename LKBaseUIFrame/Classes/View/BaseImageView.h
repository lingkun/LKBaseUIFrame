//
//  BaseImageView.h
//  Metis
//
//  Created by 曾凌坤 on 2019/9/27.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^picStateBlock)(PIC_STATE state,CGFloat progress);

@interface BaseImageView : UIImageView
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)NSString *imageUrl;
@property (nonatomic,assign)PIC_STATE state;
@property (nonatomic,copy)picStateBlock block;

@end

NS_ASSUME_NONNULL_END
