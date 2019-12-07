//
//  BaseField.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/27.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^shouldReturnBlock)(UITextField * _Nullable textField);
typedef void(^shouldBeginBlock)(UITextField *_Nullable textField);

NS_ASSUME_NONNULL_BEGIN

@interface BaseField : UITextField<UITextFieldDelegate>

@property (nonatomic,strong)UIImageView *iconImageView;
@property (nonatomic,strong)UIView *lineView;

@property (nonatomic,copy)shouldReturnBlock shouldReturn;

@property (nonatomic,copy)shouldBeginBlock shouldBegin;

- (void)initUI;

@end

NS_ASSUME_NONNULL_END
