//
//  LPPersonalCenterCell.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/20.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPPersonalCenterCell.h"

@implementation LPPersonalCenterCell

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
    self.leftImageView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        [self.bgView addSubview:image];
        image;
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
    self.rightImageView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        [self.bgView addSubview:image];
        image.image = [UIImage imageNamed:@"person_icon_jump"];
        image;
    });
}
- (void)setCellType:(LPPCBaseCellType)cellType{
    _cellType = cellType;
    if (cellType == LPPCBaseCellTypeLeftTitleAndImage) {
        [self.leftTitleLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bgView);
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(10);
            
        }];
    }
}
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.contentView);
//    }];
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.left.mas_equalTo(20);
    }];
    [self.leftTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        if (self.cellType == LPPCBaseCellTypeLeftTitleAndImage) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(10);
        }else{
            make.left.mas_equalTo(20);
        }
        
    }];
   
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.leftTitleLab);
        make.right.mas_equalTo(-20);
    }];
    [self.rightTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rightImageView);
        make.right.mas_equalTo(self.rightImageView.mas_left).offset(-10);
    }];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(0);
    }];
}


@end
