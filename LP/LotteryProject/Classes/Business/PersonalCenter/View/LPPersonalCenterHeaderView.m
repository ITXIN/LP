//
//  LPPersonalCenterHeaderView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/19.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPPersonalCenterHeaderView.h"

@implementation LPPersonalCenterHeaderView

-(void)initSubviews{
    [super initSubviews];
    
    self.bgImageView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        [self.bgView  addSubview:image];
        image.image = [UIImage imageNamed:@"bg_banner"];
        image;
    });
    self.iconView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        [self.bgView  addSubview:image];
        image.image = [UIImage imageNamed:@"head_me"];
        image;
    });
    
    self.nameLab= ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
        label.text = @"财付通";
        label;
    });
    
    self.authStatusBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:btn];
        [btn setImage:[UIImage imageNamed:@"btn_renzheng"] forState:UIControlStateNormal];
        btn;
    });
    self.amoutView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.text = @"总额(元)";
        view.lineView.backgroundColor = [UIColor whiteColor];
        view;
    });

    self.gmosaicGoldView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.text = @"彩金(元)";
        view.lineView.hidden = YES;
        view;
    });

}

- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.mas_equalTo(kStatusBarAndNavigationBarHeight);
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.mas_equalTo(self.iconView.mas_bottom).offset(5);
    }];
    [self.authStatusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.mas_equalTo(self.nameLab.mas_bottom).offset(5);
    }];
    [self.amoutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.authStatusBtn.mas_bottom).offset(10);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(kScreenWidth/2);
    }];
    [self.gmosaicGoldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(kScreenWidth/2);
        make.height.equalTo(self.amoutView);
        make.centerY.equalTo(self.amoutView);
    }];
   
}

@end
