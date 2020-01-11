//
//  LPDataStatisticsUserDataHeaderView.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/26.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseView.h"
#import "LPDoubleLineView.h"
@interface LPDataStatisticsUserDataHeaderView : LPBaseView
@property (nonatomic,strong) LPDoubleLineView *signInView;
@property (nonatomic,strong) LPDoubleLineView *amountView;
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) UIView *grayView;

@property (nonatomic,strong) UILabel *userListLab;
@property (nonatomic,strong) UIButton *signInTimeBtn;


@end
