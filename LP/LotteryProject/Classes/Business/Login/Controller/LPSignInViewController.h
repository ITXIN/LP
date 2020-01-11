//
//  LPSignInViewController.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/15.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPLoginBaseViewController.h"
typedef NS_ENUM(NSInteger,LPSignINActionType) {
    LPSignINActionTypeSendSMSCode,
    LPSignINActionTypeAgreenment,
};
@interface LPSignInViewController : LPLoginBaseViewController
@property (nonatomic,strong) LPLoginInputView *smsCodeView;
@property (nonatomic,strong) LPLoginInputView *passwordView;
@property (nonatomic,strong) LPLoginInputView *passwordCheckView;

@property (nonatomic,strong) UIButton *agreementBtn;
@property (nonatomic,strong) UIButton *sendSMSCodeBtn;

@end
