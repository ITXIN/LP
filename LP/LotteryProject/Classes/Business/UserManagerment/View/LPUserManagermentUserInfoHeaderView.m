//
//  LPUserManagermentUserInfoHeaderView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/22.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPUserManagermentUserInfoHeaderView.h"

@implementation LPUserManagermentUserInfoHeaderView

-(void)initSubviews{
    [super initSubviews];
    
    self.iconView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        [self.bgView addSubview:image];
        image.layer.cornerRadius = 85/2;
        image.layer.masksToBounds = YES;
        image.image = [UIImage imageNamed:@"user_head"];
        image;
    });
    
    self.contentView = ({
        LPDoubleLineView *view = [[LPDoubleLineView alloc]init];
        [self.bgView addSubview:view];
        view.firstLab.textColor = [UIColor lpGrayTextColor];
        view.secondLab.textColor = [UIColor lpGrayTextColor];
        view.firstLab.text = @"未设置";
        view.secondLab.text = @"余额:200.00";
        view.lineView.hidden = YES;
        view;
    });
   
}

- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.centerX.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(85, 85));
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_bottom).offset(10);
        make.height.mas_equalTo(60);
        make.centerX.equalTo(self.bgView);
        make.leading.trailing.equalTo(self.bgView);
//        make.width.mas_equalTo(130);
    }];
 
}
@end
