//
//  LPDoubleLineView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/19.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPDoubleLineView.h"

@implementation LPDoubleLineView
-(instancetype)init{
    self = [super init];
    if (self){
        
    }
    return self;
}

- (void)initSubviews{
    [super initSubviews];
    self.firstLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:13];
        label;
    });
    self.secondLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:20];
        label.text = @"0.00";
        label;
    });
    self.lineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor lpGrayLineColor];
//        view.hidden = YES;
        view;
    });
}
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.firstLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.bottom.mas_equalTo(self.bgView.mas_centerY);
        make.leading.trailing.equalTo(self.bgView);
    }];
    [self.secondLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.firstLab);
        make.top.mas_equalTo(self.firstLab.mas_bottom).offset(5);
        make.leading.trailing.equalTo(self.bgView);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(1);
        make.right.mas_equalTo(-1);
        make.centerY.equalTo(self.bgView);
    }];
    
}

@end
