//
//  BaseModel.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/20.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    PIC_STATE_LOCAL =0,//本地生成的
    PIC_STATE_DOWNLOADE_ING,//ai生成下载中
    PIC_STATE_DOWNLOAD_SUCCESS,//加载成功
    PIC_STATE_DOWNLOAD_FAILY,//加载失败
    PIC_STATE_UPLOAD_ING,//本地生成上传中
    PIC_STATE_UPLOAD_SUCCESS,//本地生成上传成功
    PIC_STATE_LOAD_SUCCESS,//加载成功
    PIC_STATE_AI_FAILED,//ai生成失败
    PIC_STATE_AI,//ai生成并下载完成
    PIC_STATE_REUPLOAD,//从新上传
    PIC_STATE_RECREATE,//从新生成
} PIC_STATE;


@interface BaseModel : NSObject
//@property (nonatomic,assign)NSInteger ID ;//= 39948;
@property (nonatomic,copy)NSString *ID;

@end

NS_ASSUME_NONNULL_END
