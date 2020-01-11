//
//  LPLoginWithPasswordViewController.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPLoginBaseViewController.h"
typedef NS_ENUM(NSInteger,LPLogInActionType) {
    LPLogInActionTypeWithSMSCode = 1000,
    LPLogInActionTypeKeepPassword,
    LPLogInActionTypeForgetPassword,
};
@interface LPLoginWithPasswordViewController : LPLoginBaseViewController
@property (nonatomic,strong) LPLoginInputView *passwordView;
@property (nonatomic,strong) UIButton *forgetPassBtn;
@property (nonatomic,strong) UIButton *keepPasswordBtn;
@property (nonatomic,strong) UIButton *loginWithSMSCodeBtn;
@end
