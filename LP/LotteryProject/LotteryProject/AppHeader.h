//
//  AppHeader.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#ifndef AppHeader_h
#define AppHeader_h
//LOG
#ifdef DEBUG  //调试阶段
#define LPLOG(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else  //发布阶段
#define LPLOG(...)
#endif

//Color
#undef    RGB
#define RGB(R,G,B)        [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]

#undef    RGBA
#define RGBA(R,G,B,A)    [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

//Size
#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kScreenHeight       [UIScreen mainScreen].bounds.size.height
#define kiPhoneX        (kScreenHeight == 812.0 &&  kScreenWidth == 375.f)


// Status bar height.
#define  kStatusBarHeight      (kiPhoneX ? 44.f : 20.f)

// Navigation bar height.
#define  kNavigationBarHeight  44.f

// Tabbar height.
#define  kTabbarHeight         (kiPhoneX ? (49.f+34.f) : 49.f)

// Tabbar safe bottom margin.
#define  kTabbarSafeBottomMargin         (kiPhoneX ? 34.f : 0.f)

// Status bar & navigation bar height.
#define  kStatusBarAndNavigationBarHeight  (kiPhoneX ? 88.f : 64.f)

// Status bar & navigation bar &Tabbar height.
#define  kStatusBarAndNavigationBarAndTabbarHeightHeight  (kTabbarHeight+kStatusBarAndNavigationBarHeight)

#define kViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

#endif /* AppHeader_h */
