//
//  LPProjectHelper.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPProjectHelper : NSObject
//通过颜色来生成一个纯色图片
+ (nullable UIImage *)imageFromColor:(nullable UIColor *)color rect:(CGRect)rect;

@end
