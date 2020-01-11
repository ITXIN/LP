//
//  LPFollowOrderCell.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/24.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseTableViewCell.h"
#import "LPDoubleLineView.h"
@interface LPFollowOrderCell : LPBaseTableViewCell
@property (nonatomic,strong) LPDoubleLineView *followNumberContentView;
@property (nonatomic,strong) LPDoubleLineView *commissionRateContentView;//佣金比例
@property (nonatomic,strong) LPDoubleLineView *singleAmountContentView;//单倍金额
@property (nonatomic,strong) LPDoubleLineView *totalAmountContentView;//总金额
@property (nonatomic,strong) UILabel *lotteryKindLab;
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UIView *horizontalLineView;
@property (nonatomic,strong) UIView *verticalLineView;
@property (nonatomic,strong) UIImageView *dirImageView;




@end
