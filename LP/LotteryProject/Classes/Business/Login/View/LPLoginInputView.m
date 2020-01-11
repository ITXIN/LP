//
//  LPLoginInputView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPLoginInputView.h"

@implementation LPLoginInputView

-(void)initSubviews{
    [super initSubviews];
    self.leftIconImageView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        [self.bgView addSubview:image];
        image;
    });
    
    self.inputTextField = ({
        UITextField *textField = [[UITextField alloc]init];
        [self.bgView addSubview:textField];
        textField.placeholder = @"";
        textField.font = [UIFont systemFontOfSize:14];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField;
    });
    
    self.lineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = RGB(222, 222, 222);
        view;
    });
    
}
-(void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.leftIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.bottom.mas_equalTo(-10);
      
    }];
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(48);
        make.centerY.equalTo(self.leftIconImageView);
        make.right.mas_equalTo(-25);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftIconImageView);
        make.right.mas_equalTo(-25);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}
@end
