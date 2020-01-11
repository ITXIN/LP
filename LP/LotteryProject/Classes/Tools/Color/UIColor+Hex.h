//
//  UIColor+Hex.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 根据十六进制字符串转颜色 格式 111111
 
 @param hexString 十六进制字符串
 @param alpha 透明度
 @return 转后的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 根据十六进制字符串转颜色 格式 111111 默认不透明
 
 @param hexString 十六进制字符串
 @return 转后的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 
 根据十六进制数字转颜色 格式 0xff111111 其中ff为透明度
 @param hex 十六进制数字颜色值;
 @return 转后的颜色
 */
+ (UIColor *)colorWithHex:(NSInteger)hex;
@end
