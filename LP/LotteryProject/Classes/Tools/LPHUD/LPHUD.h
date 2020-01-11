//
//  LPHUD.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/24.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,LPHUDType) {
    LPHUDTypeHorizontal = 1000,//横排
    LPHUDTypeVertical,//竖排
};
@interface LPHUD : UIWindow
+(instancetype)standardLPHUD;
@property (nonatomic,assign) LPHUDType lpHUDType;
@property (nonatomic,assign) BOOL isShowing;
@property(nonatomic,strong) UIView *coverView;
@property (nonatomic,strong) UIScrollView *scrollView;

- (void)showLotteryKindHUD;
- (void)hiddenLotteryKindHUD;


@end
