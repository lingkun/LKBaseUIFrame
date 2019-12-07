//
//  BaseField.m
//  Metis
//
//  Created by 曾凌坤 on 2019/8/27.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import "BaseField.h"

@implementation BaseField
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.delegate =self;
        [self addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
        [self initUI];
    }
    return self;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (self.shouldBegin) {
        self.shouldBegin(textField);
    }
    return YES;
}
- (void)textChange:(UITextField *)tf {
    if (self.shouldReturn) {
        self.shouldReturn(tf);
    }
}
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//
//    if (self.shouldReturn) {
//        self.shouldReturn(textField);
//    }
//    return YES;
//}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{   // return NO to not change text
//    YYLog(@"wb xx%@",string);
//    if (self.shouldReturn) {
//        self.shouldReturn(textField);
//    }
//    return YES;
//}
//- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason API_AVAILABLE(ios(10.0)){
//    if (self.shouldReturn) {
//        self.shouldReturn(textField);
//    }
//}
- (void)initUI{
    self.iconImageView.userInteractionEnabled =NO;
    self.textAlignment =NSTextAlignmentLeft;
    self.textColor =[UIColor whiteColor];
    self.delegate =self;
    self.leftViewMode =UITextFieldViewModeAlways;
    self.lineView.frame =CGRectMake(0, self.frame.size.height+8, self.frame.size.width, 1);
    self.leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 45, self.frame.size.height)];
}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 8, 24, 24)];
        _iconImageView.contentMode =UIViewContentModeScaleAspectFit;
        [self addSubview:_iconImageView];
    }
    return _iconImageView;
}
- (UIView *)lineView{
    if (!_lineView) {
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = rgba(104, 104, 104, 0.5);//[UIColor colorWithRGBHex:0x686868];
        [self addSubview:view];
        _lineView =view;
    }
    return _lineView;
}

@end
