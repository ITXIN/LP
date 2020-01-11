//
//  LPLoginBaseViewController.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseViewController.h"
#import "LPLoginInputView.h"
typedef void (^LPLoginBaseViewControllerCallBack)(void);
typedef void (^LPSignInBaseViewControllerCallBack)(void);
@interface LPLoginBaseViewController : LPBaseViewController
@property (nonatomic,copy) LPLoginBaseViewControllerCallBack loginBaseViewControllerCallBack;
@property (nonatomic,copy) LPSignInBaseViewControllerCallBack signInBaseViewControllerCallBack;
@property (nonatomic,strong) LPLoginInputView *phoneNumberInputView;
@property (nonatomic,strong) UIButton *nextActionBtn;
- (void)btnAction:(UIButton*)sender;
@end
