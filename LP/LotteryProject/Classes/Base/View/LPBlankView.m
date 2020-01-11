//
//  LPBlankView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/16.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBlankView.h"

@implementation LPBlankView

- (void)setBlankType:(LPBlankType)blankType{
    _blankType = blankType;
    switch (blankType) {
        case LPBlankTypeDefault:
        {
            
               break;
        }
        case LPBlankTypeOrder:
        {
            self.blankImageView.image = [UIImage imageNamed:@"blank_orders"];
            self.descripLab.text = @"暂时没有用户订单哦~";
            break;
        }
        case LPBlankTypeOrderInquiry:
        {
            self.blankImageView.image = [UIImage imageNamed:@"blank_orders"];
            self.descripLab.text = @"暂时没有用户订单哦~";
            break;
        }
        case LPBlankTypeNoUser:
        {
            self.blankImageView.image = [UIImage imageNamed:@"blank_orders"];
            self.descripLab.text = @"您还没有用户，赶快推广吧~";
            break;
        }
        case LPBlankTypeWinning:
        {
            self.blankImageView.image = [UIImage imageNamed:@"blank_orders"];
            self.descripLab.text = @"暂时没有用户订单哦~";
            break;
        }
        case LPBlankTypeAccountDetailsAward:
        {
            self.blankImageView.image = [UIImage imageNamed:@"blank_orders"];
            self.descripLab.text = @"暂时没有派奖记录哦~";
            break;
        }
        case LPBlankTypeAccountDetailsAll:
        {
            self.blankImageView.image = [UIImage imageNamed:@"blank_orders"];
            self.descripLab.text = @"暂时没有记录信息哦~";
            break;
        }
        case LPBlankTypeAccountDetailsTopUp:
        {
            self.blankImageView.image = [UIImage imageNamed:@"blank_orders"];
            self.descripLab.text = @"暂时没有充值记录哦~";
            break;
        }
        case LPBlankTypeAccountDetailsWithdraw:
        {
            self.blankImageView.image = [UIImage imageNamed:@"blank_orders"];
            self.descripLab.text = @"暂时没有提现记录哦~";
            break;
        }
        default:
            break;
    }
}
-(void)initSubviews{
    [super initSubviews];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.topShadowImageView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        [self.bgView  addSubview:image];
        image.image = [UIImage imageNamed:@"tabbar_shadow"];
        image;
    });
    self.blankImageView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        [self.bgView  addSubview:image];
        
        image;
    });
    
    self.descripLab= ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textColor = [UIColor lpThemeColor];
        label.font = [UIFont systemFontOfSize:15];
        
        label;
    });
}


- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.topShadowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(2.5);
        make.trailing.leading.equalTo(self.bgView);
    }];
    [self.blankImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.mas_equalTo(75);
    }];
    [self.descripLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.mas_equalTo(self.blankImageView.mas_bottom).offset(40);
    }];
}

@end
