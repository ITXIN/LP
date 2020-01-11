//
//  LPUserManagermentCell.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/22.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPUserManagermentCell.h"

@implementation LPUserManagermentCell

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
    self.iconView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        [self.bgView addSubview:image];
        image.layer.cornerRadius = 25;
        image.layer.masksToBounds = YES;
        image.image = [UIImage imageNamed:@"list_user_head"];
        image;
    });
    self.leftDoubleLineView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.textAlignment = NSTextAlignmentLeft;
        view.firstLab.textColor = [UIColor lpGrayTextColor];
        view.secondLab.textColor = [UIColor lpGrayTextColor];
        view.secondLab.textAlignment = NSTextAlignmentLeft;
        view.secondLab.font = [UIFont systemFontOfSize:13];
        view.lineView.hidden = YES;
        view;
    });
    
    self.rightDoubleLineView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.textAlignment = NSTextAlignmentRight;
        view.firstLab.textColor = [UIColor lpGrayTextColor];
        view.secondLab.textColor = [UIColor lpGrayTextColor];
        view.secondLab.textAlignment = NSTextAlignmentRight;
        view.secondLab.font = [UIFont systemFontOfSize:13];
        view.lineView.hidden = YES;
        view;
    });
    
//    self.leftDoubleLineView.backgroundColor = [UIColor redColor];
//    self.rightDoubleLineView.backgroundColor = [UIColor redColor];
    
    self.leftDoubleLineView.firstLab.text = @"未设置";
    self.leftDoubleLineView.secondLab.text = @"17328238328";
    self.rightDoubleLineView.firstLab.text = @"2017-10-13 12:33:45";
    self.rightDoubleLineView.secondLab.text = @"余额:234元";
}
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [self.leftDoubleLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(10);
        make.height.equalTo(self.iconView);
        make.centerY.equalTo(self.iconView);
        make.width.mas_equalTo(130);
    }];
    [self.rightDoubleLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.height.equalTo(self.iconView);
        make.centerY.equalTo(self.iconView);
        make.width.mas_equalTo(150);
    }];
    
    
}

@end
