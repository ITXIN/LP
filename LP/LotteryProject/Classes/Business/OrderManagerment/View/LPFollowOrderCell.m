//
//  LPFollowOrderCell.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/24.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPFollowOrderCell.h"

@implementation LPFollowOrderCell

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
    self.followNumberContentView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.textColor = [UIColor blackColor];
        view.secondLab.textColor = [UIColor lpGrayTextColor];
        view.firstLab.text = @"100";
        view.secondLab.text = @"跟单人数";
        view.secondLab.font = [UIFont systemFontOfSize:13];
        view.lineView.hidden = YES;
        view;
    });
    
    self.commissionRateContentView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.textColor = [UIColor blackColor];
        view.secondLab.textColor = [UIColor lpGrayTextColor];
        view.firstLab.text = @"23";
        view.secondLab.text = @"佣金比例";
        view.secondLab.font = [UIFont systemFontOfSize:13];
        view.lineView.hidden = YES;
        view;
    });
    self.singleAmountContentView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.textColor = [UIColor blackColor];
        view.secondLab.textColor = [UIColor lpGrayTextColor];
        view.firstLab.text = @"232";
        view.secondLab.text = @"单倍金额";
        view.secondLab.font = [UIFont systemFontOfSize:13];
        view.lineView.hidden = YES;
        view;
    });
    self.totalAmountContentView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.textColor = [UIColor blackColor];
        view.secondLab.textColor = [UIColor lpGrayTextColor];
        view.firstLab.text = @"345";
        view.secondLab.text = @"方案总金额";
        view.secondLab.font = [UIFont systemFontOfSize:13];
        view;
    });
    
    self.lotteryKindLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:13];
        label.text = @"竞彩足球 胜平负";
        label;
    });
    self.nameLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:13];
        label.text = @"店主";
        label;
    });
    
    self.horizontalLineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor lpGrayLineColor];
        view;
    });
    

    self.verticalLineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor lpGrayLineColor];
        view;
    });
    
    self.dirImageView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        [self.bgView addSubview:image];
        image.image = [UIImage imageNamed:@"person_icon_jump"];
        image;
    });
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor lpGrayBgColor];
    self.bgView.backgroundColor = [UIColor whiteColor];
//    self.followNumberContentView.backgroundColor = [UIColor purpleColor];
//    self.lotteryKindLab.backgroundColor = [UIColor cyanColor];
//    self.nameLab.backgroundColor = [UIColor cyanColor];
//    self.commissionRateContentView.backgroundColor = [UIColor purpleColor];
//    self.singleAmountContentView.backgroundColor = [UIColor orangeColor];
//    self.totalAmountContentView.backgroundColor = [UIColor purpleColor];
}
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.contentView);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-5);
    }];
    [self.followNumberContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(150/2);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(60);
        make.centerY.equalTo(self.bgView);
    }];
    [self.horizontalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.followNumberContentView.mas_right).offset(0);
        make.width.mas_equalTo(1);
        make.bottom.mas_equalTo(-10);
        make.top.mas_equalTo(10);
    }];
    
    [self.lotteryKindLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.horizontalLineView.mas_right).offset(5);
        make.top.equalTo(self.horizontalLineView);
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.centerY.equalTo(self.lotteryKindLab);
    }];
    [self.verticalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lotteryKindLab);
        make.right.equalTo(self.nameLab);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self.lotteryKindLab.mas_bottom).offset(10);
    }];
    [self.commissionRateContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lotteryKindLab);
        make.top.mas_equalTo(self.verticalLineView.mas_bottom).offset(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(self.singleAmountContentView.mas_left).offset(0);
    }];
    
    
    [self.totalAmountContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.nameLab);
        make.top.equalTo(self.commissionRateContentView);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.singleAmountContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.totalAmountContentView.mas_left).offset(0);
        make.left.equalTo(self.commissionRateContentView.mas_right).offset(0);
        make.top.equalTo(self.commissionRateContentView);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.dirImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(self.bgView);
    }];
}
@end
