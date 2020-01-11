//
//  LPBaseTableViewCell.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/14.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseTableViewCell.h"

@implementation LPBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self initSubviews];
        [self setupSubviewsLayout];
    }
    return self;
}
- (void)initSubviews{
    self.bgView = ({
        UIView *view = [[UIView alloc]init];
        [self.contentView addSubview:view];
        
        view;
    });
    
}
- (void)setupSubviewsLayout{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}
@end
