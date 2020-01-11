//
//  LPLoginRootController.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseViewController.h"
//#import "LPBaseNavigationController.h"
typedef NS_ENUM(NSInteger,LPLoginRootBtnType)
{
    LPLoginRootBtnTypeLogin = 1000,
    LPLoginRootBtnTypeSignin,
};
@interface LPLoginRootController : LPBaseViewController
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIButton *logInBtn;
@property (nonatomic,strong) UIButton *signInBtn;
@property (nonatomic,strong) NSMutableArray *imagesArr;

@end
