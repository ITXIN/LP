//
//  LPBlankView.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/16.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseView.h"
typedef NS_ENUM(NSInteger,LPBlankType) {
    LPBlankTypeDefault = 1000,
    LPBlankTypeOrder,//订单管理
    LPBlankTypeWinning,//中奖
    LPBlankTypeOrderInquiry,//订单查询
    LPBlankTypeNoUser,//用户管理
    LPBlankTypeAccountDetailsAll,//账户明细
    LPBlankTypeAccountDetailsAward,//派奖
    LPBlankTypeAccountDetailsTopUp,//充值
    LPBlankTypeAccountDetailsWithdraw,//提现
};
@interface LPBlankView : LPBaseView
@property (nonatomic,strong) UIImageView *topShadowImageView;

@property (nonatomic,strong) UILabel *descripLab;
@property (nonatomic,strong) UIImageView *blankImageView;
@property (nonatomic,assign) LPBlankType blankType;

@end
