//
//  LPDataStatisticsCell.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/20.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPDataStatisticsCell.h"

@implementation LPDataStatisticsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)initSubviews{
    [super initSubviews];
    self.titleView = ({
        LPDataStatisticsTitleView *view = [[LPDataStatisticsTitleView alloc]init];
        [self.bgView addSubview:view];
        view.titleLab.text = @"";
        view;
    });
    
    self.leftContenView = ({
        LPMultilineTextView *view = [[LPMultilineTextView alloc]init];
        [self.bgView addSubview:view];
        view;
    });
    self.rightContenView = ({
        LPMultilineTextView *view = [[LPMultilineTextView alloc]init];
        [self.bgView addSubview:view];
        view.lineView.hidden = YES;
        view;
    });
    self.midContenView = ({
        LPMultilineTextView *view = [[LPMultilineTextView alloc]init];
        [self.bgView addSubview:view];
        view;
    });
    
    
    self.detailBtn= ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.bgView addSubview:btn];
        [btn setTitle:@"详情 >" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(detailBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
//    self.leftContenView.backgroundColor = [UIColor yellowColor];
//    self.midContenView.backgroundColor = [UIColor purpleColor];
//    self.rightContenView.backgroundColor = [UIColor cyanColor];
}
#pragma mark -
- (void)detailBtnAction:(UIButton*)sender{
    if (self.dataStatisticsDetailBtnTypeBlock) {
        self.dataStatisticsDetailBtnTypeBlock(sender.tag);
    }
}

- (void)setupDataWithSection:(NSInteger)section titleArr:(NSArray*)titleArr{
    NSInteger numberLine = 0;
    if (section == 0) {
        numberLine = 2;
        self.dataStatisticsDetailType = LPDataStatisticsDetailTypeUserData;
    }else if (section == 1) {
        numberLine = 3;
        self.dataStatisticsDetailType = LPDataStatisticsDetailTypeTicketData;
    }else if (section == 2){
        numberLine = 3;
        self.dataStatisticsDetailType = LPDataStatisticsDetailTypeAwardData;
    }else{
        numberLine = 3;
        self.dataStatisticsDetailType = LPDataStatisticsDetailTypeTakeTicketData;
    }
    self.leftContenView.lineNumber = numberLine;
    self.rightContenView.lineNumber = numberLine;
    self.midContenView.lineNumber = numberLine;
    [self setupContentViewWithArr:titleArr];
}

- (void)setDataStatisticsDetailType:(LPDataStatisticsDetailType)dataStatisticsDetailType{
    _dataStatisticsDetailType = dataStatisticsDetailType;
    self.detailBtn.tag = dataStatisticsDetailType;
}
- (void)setupContentViewWithArr:(NSArray*)titleArr{
    UIColor *titleColor = [UIColor lpGrayTextColor];
    UIFont *titleFont = [UIFont systemFontOfSize:13];
    UIColor *contextColor = [UIColor lpBlackTextColor];
    UIFont *contextFont = [UIFont systemFontOfSize:14];
    for (NSInteger i = 0 ; i < self.leftContenView.labelArr.count; i ++) {
        if (i == 0) {
            [self.leftContenView setupMultilineTextWithRow:i text:titleArr[0]];
            [self.leftContenView setupMultilineWithRow:0 font:titleFont textColor:titleColor];
            
            [self.midContenView setupMultilineTextWithRow:i text:titleArr[1]];
            [self.midContenView setupMultilineWithRow:0 font:titleFont textColor:titleColor];
            
            [self.rightContenView setupMultilineTextWithRow:i text:titleArr[2]];
            [self.rightContenView setupMultilineWithRow:0 font:titleFont textColor:titleColor];
        }else{
            [self.leftContenView setupMultilineTextWithRow:i text:@"注册用户"];
            [self.leftContenView setupMultilineWithRow:i font:contextFont textColor:contextColor];
            
            [self.midContenView setupMultilineTextWithRow:i text:@"注册用户"];
            [self.midContenView setupMultilineWithRow:i font:contextFont textColor:contextColor];
            
            [self.rightContenView setupMultilineTextWithRow:i text:@"注册用户"];
            [self.rightContenView setupMultilineWithRow:i font:contextFont textColor:contextColor];
        }
        
    }
    
}

- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.bgView);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.bottom.mas_equalTo(-5);
    }];
    [self.leftContenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleView.mas_bottom).offset(18);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(kScreenWidth/3);
        make.bottom.mas_equalTo(self.detailBtn.mas_top).offset(0);
    }];
    [self.rightContenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.width.bottom.equalTo(self.leftContenView);
    }];
    [self.midContenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.width.bottom.equalTo(self.leftContenView);
    }];
    
}

@end
