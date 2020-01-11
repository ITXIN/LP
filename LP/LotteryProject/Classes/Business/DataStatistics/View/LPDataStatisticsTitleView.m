//
//  LPDataStatisticsTitleView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/20.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPDataStatisticsTitleView.h"

@implementation LPDataStatisticsTitleView
- (void)initSubviews{
    [super initSubviews];
    self.titleLab= ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        //        label.textColor = <#color#>;
        label.font = [UIFont systemFontOfSize:15];
        
        label;
    });
    self.leftLineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor lpGrayLineColor];
        view;
    });
    self.rightLineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor lpGrayLineColor];
        view;
    });
    self.bottomLineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor lpGrayBgColor];
        view;
    });
}

- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgView);
    }];
    [self.leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.titleLab.mas_left).offset(-30);
        make.centerY.equalTo(self.titleLab);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(1);
    }];
    [self.rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLab.mas_right).offset(30);
        make.centerY.equalTo(self.titleLab);
        make.width.equalTo(self.leftLineView);
        make.height.equalTo(self.leftLineView);
    }];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.leading.equalTo(self.bgView);
        make.height.mas_equalTo(2);
        make.bottom.mas_equalTo(0);
    }];
}

@end
