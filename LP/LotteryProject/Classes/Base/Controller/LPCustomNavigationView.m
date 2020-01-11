//
//  LPCustomNavigationView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/19.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPCustomNavigationView.h"

@implementation LPCustomNavigationView

-(void)initSubviews{
    [super initSubviews];
    
    self.leftItemBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@"nav_edit"] forState:UIControlStateNormal];
        btn.tag = 1000;
        btn;
    });
    self.titleLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.bgView addSubview:label];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
        
        label;
    });
    self.rightItemBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@"nav_message"] forState:UIControlStateNormal];
        btn.tag = 1001;
        btn;
    });
    
}
#pragma mark -
- (void)btnAction:(UIButton*)sender{
    if (sender.tag == 1000) {
        if (self.customNavigationLeftItemBlock) {
            self.customNavigationLeftItemBlock();
        }
    }else if(sender.tag == 1001){
        if (self.customNavigationRightItemBlock) {
            self.customNavigationRightItemBlock();
        }
    }
}
#pragma mark -
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.leftItemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.bottom.equalTo(self.leftItemBtn);
    }];
    [self.rightItemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.bottom.equalTo(self.leftItemBtn);
    }];
}
@end
