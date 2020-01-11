//
//  UIColor+Hex.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+ (unsigned int)intFromHexString:(NSString *)hexStr
{
    unsigned int hexInt = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexInt];
    return hexInt;
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    unsigned int hexint = [self intFromHexString:hexString];
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    return color;
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [self colorWithHexString:hexString alpha:1];
}

+ (UIColor *)colorWithHex:(NSInteger)hex
{
    CGFloat alpha = ((CGFloat)((hex & 0xff000000) >> 24)) / 255.0;
    CGFloat red = ((CGFloat)((hex & 0x00ff0000) >> 16)) / 255.0;
    CGFloat green = ((CGFloat)((hex & 0x0000ff00) >> 8)) / 255.0;
    CGFloat blue = ((CGFloat)((hex & 0x000000ff) >> 0)) / 255.0;
    return [self colorWithRed:red green:green blue:blue alpha:alpha];
}
@end
