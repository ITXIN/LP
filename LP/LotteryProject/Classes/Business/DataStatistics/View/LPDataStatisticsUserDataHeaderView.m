//
//  LPDataStatisticsUserDataHeaderView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/26.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPDataStatisticsUserDataHeaderView.h"

@implementation LPDataStatisticsUserDataHeaderView

-(void)initSubviews{
    [super initSubviews];
    self.signInView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.text = @"注册用户（人）";
        view.secondLab.text = @"10";
        view.firstLab.textColor = [UIColor lpGrayTextColor];
        view.secondLab.textColor = [UIColor lpBlackTextColor];
        view;
    });
    
    self.amountView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.text = @"投注金额 (元)";
        view.secondLab.text = @"10";
        view.lineView.hidden = YES;
        
        view.firstLab.textColor = [UIColor lpGrayTextColor];
        view.secondLab.textColor = [UIColor lpBlackTextColor];
        view;
    });
    
    self.bottomView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        
        view;
    });
    
    self.grayView = ({
        UIView *view = [[UIView alloc]init];
        [self.bottomView addSubview:view];
        view.backgroundColor = [UIColor lpGrayLineColor];
        view;
    });
   
    
    self.userListLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bottomView addSubview:label];
//        label.textColor = ;
        label.font = [UIFont systemFontOfSize:15];
        label.text = @"用户列表";
        label;
    });
    
    self.signInTimeBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bottomView addSubview:btn];
        [btn setTitle:@"时间注册" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor lpThemeColor] forState:UIControlStateNormal];
        btn;
    });
    self.bgView.backgroundColor = [UIColor whiteColor];
//    self.signInView.backgroundColor = [UIColor yellowColor];
//    self.amountView.backgroundColor = [UIColor purpleColor];
//    self.bottomView.backgroundColor = [UIColor cyanColor];
//    self.userListLab.backgroundColor = [UIColor yellowColor];
//    self.signInTimeBtn.backgroundColor = [UIColor yellowColor];
    
}
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.signInView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(kScreenWidth/2);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(190/2);
    }];
    [self.amountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.top.equalTo(self.signInView);
        make.right.mas_equalTo(0);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.bgView);
        make.top.mas_equalTo(self.signInView.mas_bottom).offset(0);
        make.bottom.mas_equalTo(0);
    }];
    [self.grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.bottomView);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(15);
    }];

    [self.userListLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self.grayView.mas_bottom).offset(0);
        make.bottom.mas_equalTo(0);
    }];
    [self.signInTimeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(self.userListLab);
    }];
    
}
@end
