//
//  LPSignInViewController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/15.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPSignInViewController.h"
#import "NSObject+RACPropertySubscribing.h"
@interface LPSignInViewController ()
@property(nonatomic,assign)__block NSInteger remainSeconds;
@property(nonatomic,assign)__block  NSInteger startCheckTimer;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation LPSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#warning 创建两次
- (void)initSubviews{
    [super initSubviews];
    self.title = @"注册";
    
    self.smsCodeView = [[LPLoginInputView alloc]init];
    [self.bgView addSubview:self.smsCodeView];
    self.smsCodeView.inputTextField.placeholder = @"验证码";
    self.smsCodeView.leftIconImageView.image = [UIImage imageNamed:@"icon_password"];
    self.smsCodeView.inputTextField.keyboardType = UIKeyboardTypeDefault;
    
    self.passwordView = [[LPLoginInputView alloc]init];
    [self.bgView addSubview:self.passwordView];
    self.passwordView.inputTextField.placeholder = @"登录密码(6~16位数字/字母或组合)";
    self.passwordView.inputTextField.secureTextEntry = YES;
    self.passwordView.leftIconImageView.image = [UIImage imageNamed:@"icon_password"];
    self.passwordView.inputTextField.keyboardType = UIKeyboardTypeDefault;
    
    self.passwordCheckView = [[LPLoginInputView alloc]init];
    [self.bgView addSubview:self.passwordCheckView];
    self.passwordCheckView.inputTextField.placeholder = @"请再次输入";
    self.passwordCheckView.inputTextField.secureTextEntry = YES;
    self.passwordCheckView.leftIconImageView.image = [UIImage imageNamed:@"icon_password"];
    self.passwordCheckView.inputTextField.keyboardType = UIKeyboardTypeDefault;
    
    [self.nextActionBtn setTitle:@"下一步" forState:UIControlStateNormal];

    self.sendSMSCodeBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:btn];
        btn.tag = LPSignINActionTypeSendSMSCode;
        [btn addTarget:self action:@selector(signInBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lpThemeColor] forState:UIControlStateNormal];
        btn;
    });
    
    self.agreementBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:btn];
        [btn setImage:[UIImage imageNamed:@"icon_agree"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"icon_unagree"] forState:UIControlStateSelected];
        //button标题的偏移量，这个偏移量是相对于图片的
        btn.titleEdgeInsets = UIEdgeInsetsMake(0,btn.imageView.frame.size.width, 0, 0);
        //button图片的偏移量，距上左下右分别像素点
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -btn.titleLabel.frame.size.width+btn.imageView.frame.size.width+10);
        [btn setTitle:@"请您阅读并同意<<用户服务协议>>" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        //设置button正常状态下的标题颜色
        [btn addTarget:self action:@selector(signInBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = LPSignINActionTypeAgreenment;
        [btn setAttributedTitle:[self setupDecripAttribut:@"请您阅读并同意<<用户服务协议>>" rangeStr:@"<<用户服务协议>>" rangeColor:[UIColor redColor]] forState:UIControlStateNormal];
        btn;
    });
    
    [self setupSignal];
}
- (NSMutableAttributedString*)setupDecripAttribut:(NSString*)descStr rangeStr:(NSString*)rangeStr rangeColor:(UIColor*)color {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:descStr];
    NSRange numRange = [descStr rangeOfString:rangeStr];
    [str addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(numRange.location, numRange.length)];
    //    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica Bold"  size:12.0] range:NSMakeRange(numRange.location, numRange.length)];
    return  str;
}


- (void)setupSignal{
    RACSignal *enablsignal  = [[RACSignal combineLatest:@[self.phoneNumberInputView.inputTextField.rac_textSignal,self.smsCodeView.inputTextField.rac_textSignal,self.passwordView.inputTextField.rac_textSignal,self.passwordCheckView.inputTextField.rac_textSignal]] map:^id(id value) {
        NSLog(@"value---%@",value);
        //        if (![value[2] isEqualToString:value[3]] && [value[2] length] >=6 && [value[3] length] >=6) {
        //            [self.view makeToast:@"输入密码不一致"];
        //        }
        return @([value[0] length] > 0 && [value[1] length] > 0 && [value[2] length] >= 6 &&[value[3] length] >=6 && [value[2] isEqualToString:value[3]] );
    }];
    RAC(self.nextActionBtn,enabled) = enablsignal;
    
    
    RAC(self.sendSMSCodeBtn, enabled) = [RACSignal
                                         combineLatest:@[
                                                         RACObserve(self, self.remainSeconds),
                                                         RACObserve(self, self.startCheckTimer)
                                                         ]
                                         reduce:^id(NSNumber* remain, NSNumber* startCheck) {
                                             return@( remain.intValue == 0 && self.startCheckTimer == 0);
                                         }] ;
    
}
- (void)setupSendSMSCodeSignal{
    self.remainSeconds = 10;
    self.startCheckTimer = -1;
    if (!self.timer) {
        self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(sendSMSCodeTimer:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSDefaultRunLoopMode];
        
    }
   
}
#pragma mark -
- (void)sendSMSCodeTimer:(NSTimer*)timer{
    NSString *text = @"";
    if(self.remainSeconds > 0){
        self.remainSeconds = self.remainSeconds - 1;
        if(self.remainSeconds == 0){
            self.startCheckTimer = 0;
            [self.timer invalidate];
            self.timer = nil;
            text = @"获取验证码";
        }else{
            text = [NSString stringWithFormat:@"请稍等%ld秒",self.remainSeconds];
        }
        
    }else{
        text = @"获取验证码";
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.sendSMSCodeBtn setTitle:text forState:UIControlStateNormal];
    });
    
}

#pragma mark - 下一步
- (void)btnAction:(UIButton *)sender{
    if (self.signInBaseViewControllerCallBack) {
        self.signInBaseViewControllerCallBack();
    }
}
#pragma mark - agreementBtnAction
- (void)signInBtnAction:(UIButton*)sender{
    switch (sender.tag) {
        case LPSignINActionTypeSendSMSCode:
        {
            [self setupSendSMSCodeSignal];
             break;
        }
        case LPSignINActionTypeAgreenment:
        {
             sender.selected = !sender.selected;
            break;
        }
            
        default:
            break;
    }
   
}
#pragma mark -
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.smsCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneNumberInputView.mas_bottom).offset(0);
        make.leading.trailing.equalTo(self.bgView);
        make.height.equalTo(self.phoneNumberInputView);
    }];
    [self.sendSMSCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-25);
        make.centerY.equalTo(self.smsCodeView.leftIconImageView);
    }];
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.smsCodeView.mas_bottom).offset(0);
        make.leading.trailing.equalTo(self.bgView);
        make.height.equalTo(self.phoneNumberInputView);
    }];
    [self.passwordCheckView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordView.mas_bottom).offset(0);
        make.leading.trailing.equalTo(self.bgView);
        make.height.equalTo(self.phoneNumberInputView);
    }];
    
    [self.nextActionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(320, 44));
        make.top.mas_equalTo(self.passwordCheckView.mas_bottom).offset(35);;
    }];
    
    [self.agreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.mas_equalTo(self.nextActionBtn.mas_bottom).offset(15);
        make.width.equalTo(self.bgView);
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
