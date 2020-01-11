//
//  LPLoginWithPasswordViewController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPLoginWithPasswordViewController.h"
#import "LPSignInViewController.h"
@interface LPLoginWithPasswordViewController ()

@end

@implementation LPLoginWithPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#warning 创建两次
- (void)initSubviews{
    [super initSubviews];
    self.title = @"登录";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(signInAction:)];
    
    self.passwordView = [[LPLoginInputView alloc]init];
    [self.bgView addSubview:self.passwordView];
    self.passwordView.inputTextField.placeholder = @"密码";
    self.passwordView.inputTextField.secureTextEntry = YES;
    self.passwordView.leftIconImageView.image = [UIImage imageNamed:@"icon_password"];
    self.passwordView.inputTextField.keyboardType = UIKeyboardTypeDefault;
    
    [self.nextActionBtn setTitle:self.title forState:UIControlStateNormal];
    
    self.keepPasswordBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:btn];
        [btn setImage:[UIImage imageNamed:@"icon_unchecked"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"icon_checked"] forState:UIControlStateSelected];
        //button标题的偏移量，这个偏移量是相对于图片的
        btn.titleEdgeInsets = UIEdgeInsetsMake(0,btn.imageView.frame.size.width+10, 0, 0);
        //button图片的偏移量，距上左下右分别像素点
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -btn.titleLabel.frame.size.width+btn.imageView.frame.size.width);
        [btn setTitle:@"记住密码" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor lpGrayTextColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        //设置button正常状态下的标题颜色
        [btn addTarget:self action:@selector(loginViewBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = LPLogInActionTypeKeepPassword;
        btn;
    });
    
    self.forgetPassBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.bgView addSubview:btn];
        [btn setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lpGrayTextColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = LPLogInActionTypeForgetPassword;
        [btn addTarget:self action:@selector(loginViewBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    self.loginWithSMSCodeBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.bgView addSubview:btn];
        [btn setTitle:@"使用短信验证码登录" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lpGrayTextColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = LPLogInActionTypeWithSMSCode;
        [btn addTarget:self action:@selector(loginViewBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self setupSingle];
}

- (void)setupSingle{
    RACSignal *enablsignal  = [[RACSignal combineLatest:@[self.phoneNumberInputView.inputTextField.rac_textSignal,self.passwordView.inputTextField.rac_textSignal]] map:^id(id value) {
        NSLog(@"value---%@",value);
        return @([value[0] length] > 0 && [value[1] length] >= 6);
    }];
    
    //    self.nextActionBtn.rac_command = [[RACCommand alloc]initWithEnabled:enablsignal signalBlock:^RACSignal *(id input) {
    //        NSLog(@"input---%@",input);
    //        return [RACSignal empty];
    //    }];
    
    RAC(self.nextActionBtn,enabled) = enablsignal;
    
}


#pragma mark -
- (void)btnAction:(UIButton *)sender{
    if (self.loginBaseViewControllerCallBack) {
        self.loginBaseViewControllerCallBack();
    }
}

- (void)signInAction:(UITabBarItem*)sender{
    LPSignInViewController *signInVC = [[LPSignInViewController alloc]init];
    [self.navigationController pushViewController:signInVC animated:YES];
}
- (void)loginViewBtnAction:(UIButton*)sender{
    switch (sender.tag) {
        case LPLogInActionTypeWithSMSCode:
        {
            break;
        }
        case LPLogInActionTypeKeepPassword:
        {
            sender.selected = !sender.selected;
            break;
        }
        case LPLogInActionTypeForgetPassword:
        {
            break;
        }
            
        default:
            break;
    }
    
}
#pragma mark -
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneNumberInputView.mas_bottom).offset(0);
        make.leading.trailing.equalTo(self.bgView);
        make.height.equalTo(self.phoneNumberInputView);
    }];
    
    [self.keepPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordView.lineView).offset(-5);
        make.top.mas_equalTo(self.passwordView.mas_bottom).offset(15);
        make.width.mas_equalTo(85);
    }];
    [self.forgetPassBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.passwordView.lineView);
        make.centerY.equalTo(self.keepPasswordBtn);
    }];
    [self.nextActionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(320, 44));
        make.top.mas_equalTo(self.forgetPassBtn.mas_bottom).offset(15);;
    }];
    [self.loginWithSMSCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.mas_equalTo(self.nextActionBtn.mas_bottom
                             ).offset(10);
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
