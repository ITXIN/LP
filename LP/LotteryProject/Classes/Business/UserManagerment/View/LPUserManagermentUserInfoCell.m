//
//  LPUserManagermentUserInfoCell.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/22.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPUserManagermentUserInfoCell.h"

@implementation LPUserManagermentUserInfoCell

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
    
    self.bottomLineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor lpGrayBgColor];
        view;
    });
    self.leftTitleLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label;
    });
    self.rightTitleLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textAlignment = NSTextAlignmentRight;
        label;
    });
    self.leftTitleLab.textColor = [UIColor lpGrayTextColor];
    self.rightTitleLab.textColor = [UIColor lpGrayTextColor];
    self.leftTitleLab.text = @"left";
    self.rightTitleLab.text = @"right";
   
}
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [self.leftTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.left.mas_equalTo(10);
    }];
    
  
    [self.rightTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.leftTitleLab);
        make.right.mas_equalTo(-10);
    }];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(0);
    }];
}
@end
