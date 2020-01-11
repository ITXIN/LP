//
//  LPOrderell.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/14.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPOrderCell.h"

@implementation LPOrderCell

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
        image.backgroundColor = [UIColor whiteColor];
        image.image = [UIImage imageNamed:@"tab_mine_pre"];
        //        image.layer.cornerRadius = 25;
        //        image.layer.masksToBounds = YES;
        //        image.contentMode = UIViewContentModeScaleToFill;
        
        image;
    });
    self.contentLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        label.backgroundColor = [UIColor cyanColor];
        label;
    });
}
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(15);
    }];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(10);
        make.centerY.equalTo(self.iconView);
        
    }];
}
@end

