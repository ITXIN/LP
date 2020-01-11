//
//  LPDataStatisticsUserDataCell.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/27.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPDataStatisticsUserDataCell.h"

@implementation LPDataStatisticsUserDataCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)initSubviews{
    [super initSubviews];
    self.leftContenView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.textColor = [UIColor blackColor];
        view.secondLab.textColor = [UIColor lpGrayTextColor];
        view.firstLab.text = @"23";
        view.secondLab.text = @"佣金比例";
        view.secondLab.font = [UIFont systemFontOfSize:13];
        view;
    });
    self.midContenView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.textColor = [UIColor blackColor];
        view.secondLab.textColor = [UIColor lpGrayTextColor];
        view.firstLab.text = @"232";
        view.secondLab.text = @"单倍金额";
        view.secondLab.font = [UIFont systemFontOfSize:13];
        
        view;
    });
    self.rightContenView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.textColor = [UIColor blackColor];
        view.secondLab.textColor = [UIColor lpGrayTextColor];
        view.firstLab.text = @"345";
        view.secondLab.text = @"方案总金额";
        view.secondLab.font = [UIFont systemFontOfSize:13];
        view.lineView.hidden = YES;
        view;
    });
    
    self.titleView = ({
        LPCommonLRLTitleView *view = [[LPCommonLRLTitleView alloc]init];
        [self.bgView addSubview:view];
        view.leftLab.text = @"用户名:829389382989";
        view.rightLab.text = @"2017-9-20 23:21:34";
        view;
    });
    
    
}

- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.bgView);
        make.top.mas_equalTo(0);
        make.centerX.equalTo(self.bgView);
        make.height.mas_equalTo(40);
    }];
    [self.leftContenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleView.mas_bottom).offset(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(kScreenWidth/3);
        make.bottom.mas_equalTo(0);
    }];
    [self.rightContenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.width.bottom.equalTo(self.leftContenView);
    }];
    [self.midContenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.width.bottom.equalTo(self.leftContenView);
    }];
    
}
@end
