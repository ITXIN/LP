//
//  LPLoginRootController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPLoginRootController.h"

#import "LPMainViewController.h"
#import "LPLoginWithPasswordViewController.h"
#import "LPSignInViewController.h"
@interface LPLoginRootController ()

@end

@implementation LPLoginRootController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (void)initSubviews{
    [super initSubviews];
    
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc]init];
    [self.bgView addSubview:self.scrollView];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    
    self.imagesArr = [NSMutableArray array];
    for (NSInteger i = 0 ; i < 4; i ++) {
        UIImageView *lanchImage =  ({
            UIImageView *image = [[UIImageView alloc]init];
            [self.scrollView addSubview:image];
            image.image = [UIImage imageNamed:[NSString stringWithFormat:@"Lanch%ld",i+1]];
            image;
        });
        [self.imagesArr addObject:lanchImage];
        
    }
    
    
    self.bottomView= ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor whiteColor];
        view;
    });
    UIColor *color = RGB(51, 49, 54);
    self.logInBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bottomView addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"登录" forState:UIControlStateNormal];
        btn.tag = LPLoginRootBtnTypeLogin;
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitleColor:color forState:UIControlStateNormal];
        btn.layer.cornerRadius = 15;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        btn.layer.borderColor = color.CGColor;
        btn.layer.borderWidth = 1;
        btn.layer.masksToBounds = YES;
        btn;
    });
    self.signInBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bottomView addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"注册" forState:UIControlStateNormal];
        btn.tag = LPLoginRootBtnTypeSignin;
        [btn setBackgroundColor:color];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 15;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        btn.layer.borderColor = color.CGColor;
        btn.layer.borderWidth = 1;
        btn.layer.masksToBounds = YES;
        btn;
    });
}
#pragma mark -
- (void)btnAction:(UIButton*)sender{
    switch (sender.tag) {
        case LPLoginRootBtnTypeLogin:
        {
            LPLoginWithPasswordViewController *loginVC = [[LPLoginWithPasswordViewController alloc]init];
            loginVC.loginBaseViewControllerCallBack = ^{
                
                LPMainViewController *mainVC = [[LPMainViewController alloc]init];
                [self restoreRootViewController:mainVC];
            };
            [self.navigationController pushViewController:loginVC animated:YES];
            
            break;
        }
        case LPLoginRootBtnTypeSignin:
        {
            LPSignInViewController *signInVC = [[LPSignInViewController alloc]init];
            signInVC.signInBaseViewControllerCallBack = ^{
                
                LPMainViewController *mainVC = [[LPMainViewController alloc]init];
                [self restoreRootViewController:mainVC];
            };
            [self.navigationController pushViewController:signInVC animated:YES];
            
            break;
        }
            
        default:
            break;
    }
    
}

- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        
            if (kiPhoneX) {
//                if (@available(iOS 11.0, *)) {
//                    make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(0);
//                } else {
//                    // Fallback on earlier versions
//                }
                make.top.mas_equalTo(kStatusBarAndNavigationBarHeight);
            }else{
                make.top.mas_equalTo(0);
            }
       
        make.bottom.mas_equalTo(self.bottomView.mas_top).offset(0);
    }];
    
    self.scrollView.contentSize = CGSizeMake(4*kScreenWidth, 0);
    for (NSInteger i = 0 ; i < self.imagesArr.count; i ++) {
        UIImageView *lanchImage = self.imagesArr[i];
        [lanchImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(i*kScreenWidth);
            make.top.mas_equalTo(0);
            make.size.equalTo(self.scrollView);
//            make.width.mas_equalTo(kScreenWidth);
//            make.bottom.equalTo(self.scrollView);
        }];
    }
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.bgView);
        make.height.mas_equalTo(130);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(0);
        }else {
            make.bottom.mas_equalTo(0);
        }
    }];
    
    [self.logInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView);
        make.right.mas_equalTo(self.bottomView.mas_centerX).offset(-10);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(30);
    }];
    [self.signInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.logInBtn);
        make.left.mas_equalTo(self.bottomView.mas_centerX).offset(10);
        make.size.equalTo(self.logInBtn);
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
