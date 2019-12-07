//
//  BaseController.h
//  Metis
//
//  Created by 曾凌坤 on 2019/8/26.
//  Copyright © 2019 曾凌坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "extobjc.h"

typedef void(^callBack)(id _Nullable obj);

NS_ASSUME_NONNULL_BEGIN

@interface BaseController : UIViewController

@property (nonatomic,copy)callBack block;
@property (nonatomic,strong)NSDictionary *param;


- (void)initUI;
- (void)getData;
@end

NS_ASSUME_NONNULL_END
