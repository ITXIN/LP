//
//  LPCommonLRLTitleView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/27.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPCommonLRLTitleView.h"

@implementation LPCommonLRLTitleView

-(void)initSubviews{
    [super initSubviews];
    self.leftLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:13];
        label.text = @"";
        label;
    });
    self.rightLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:13];
        label.text = @"";
        label;
    });
    self.topLineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor grayColor];
        view;
    });
    self.bottomLineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor lpGrayLineColor];
        view;
    });
}
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.bgView);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(0);
    }];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.bgView);
    }];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(self.leftLab);
    }];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.bgView);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(-1);
    }];
}

@end
