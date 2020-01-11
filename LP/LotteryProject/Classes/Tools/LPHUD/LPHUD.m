//
//  LPHUD.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/24.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPHUD.h"

@implementation LPHUD

+(instancetype)standardLPHUD{
    static LPHUD *lpHUD;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lpHUD = [[LPHUD alloc]initWithFrame:CGRectMake(0, kStatusBarAndNavigationBarHeight, kScreenWidth, kScreenHeight-kStatusBarAndNavigationBarHeight)];
        lpHUD.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        lpHUD.windowLevel = UIWindowLevelNormal;
        lpHUD.hidden = NO;
        [[UIApplication sharedApplication].keyWindow addSubview:lpHUD];
        lpHUD.lpHUDType = LPHUDTypeHorizontal;
    });
    return lpHUD;
}

- (UIView *)coverView{
    if (!_coverView) {
        _coverView = ({
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
            view;
        });
    }
    return _coverView;
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(kScreenWidth/4, 0, kScreenWidth/4*3, kScreenHeight)];
    }
    return _scrollView;
}
- (void)showLotteryKindHUD{
    if (self.lpHUDType == LPHUDTypeHorizontal) {
        [LPHUD standardLPHUD].frame = CGRectMake(0, kStatusBarAndNavigationBarHeight, kScreenWidth, kScreenHeight-kStatusBarAndNavigationBarHeight);
        [[LPHUD standardLPHUD] addSubview:self.coverView];
        self.coverView.backgroundColor = [UIColor yellowColor];
        [LPHUD standardLPHUD].hidden = NO;
        self.isShowing = YES;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenWindown:)];
        [[LPHUD standardLPHUD] addGestureRecognizer:tapGes];
    }else{
        
        [LPHUD standardLPHUD].frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [[LPHUD standardLPHUD] addSubview:self.scrollView];
        [self.scrollView addSubview:self.coverView];
        self.coverView.frame = CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
//        [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self.scrollView);
//        }];
        self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame)+10, 0);
        self.coverView.backgroundColor = [UIColor redColor];
        self.scrollView.backgroundColor = [UIColor cyanColor];
        [LPHUD standardLPHUD].hidden = NO;
        self.isShowing = YES;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenWindown:)];
        [[LPHUD standardLPHUD] addGestureRecognizer:tapGes];
    }
    
}
- (void)hiddenWindown:(UITapGestureRecognizer*)sender{
    [self hiddenLotteryKindHUD];
}
- (void)hiddenLotteryKindHUD{
    for (UIWindow *window in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([window isEqual:[LPHUD standardLPHUD]]) {
            [window removeFromSuperview];
            [[LPHUD standardLPHUD]removeFromSuperview];
            [self.coverView removeFromSuperview];
            self.coverView = nil;
            self.isShowing = NO;
            [self.scrollView removeFromSuperview];
            self.scrollView = nil;
            [LPHUD standardLPHUD].hidden = YES;
        }
    }
    
    
}

@end
