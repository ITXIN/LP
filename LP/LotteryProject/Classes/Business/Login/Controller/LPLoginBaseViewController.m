//
//  LPLoginBaseViewController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPLoginBaseViewController.h"

@interface LPLoginBaseViewController ()

@end

@implementation LPLoginBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initSubviews{
    [super initSubviews];
    self.phoneNumberInputView = [[LPLoginInputView alloc]init];
    [self.bgView addSubview:self.phoneNumberInputView];
    self.phoneNumberInputView.inputTextField.placeholder = @"手机号码";
    self.phoneNumberInputView.leftIconImageView.image = [UIImage imageNamed:@"icon_mob"];
    self.phoneNumberInputView.inputTextField.keyboardType = UIKeyboardTypeNumberPad;

    
    self.nextActionBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:btn];
        [btn setBackgroundImage:[LPProjectHelper imageFromColor:[UIColor lpThemeColor] rect:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)]forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        btn;
    });
}
#pragma mark -
- (void)btnAction:(UIButton*)sender{
   
}

- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.phoneNumberInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.leading.trailing.equalTo(self.bgView);
        make.height.mas_equalTo(62);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
