//
//  LPUserManagermentSearchController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/25.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPUserManagermentSearchController.h"

@interface LPUserManagermentSearchController ()
@property (nonatomic,strong) UITextField *searchTextField;
@property (nonatomic,strong) UIView *titleView;
@end

@implementation LPUserManagermentSearchController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:0.75 animations:^{
        self.searchTextField.alpha = 1.0;
    }];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:0.15 animations:^{
        self.searchTextField.alpha = 0.0;
    }];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [UIView animateWithDuration:0.15 animations:^{
        self.searchTextField.alpha = 0.0;
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)initSubviews{
    [super initSubviews];
    
    self.titleView = ({
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        view;
    });
    self.titleView.backgroundColor = [UIColor yellowColor];
    self.searchTextField = ({
        UITextField *view = [[UITextField alloc]init];
        view.borderStyle = UITextBorderStyleRoundedRect;
        view.backgroundColor = [UIColor whiteColor];
        [self.titleView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kScreenWidth-150, 30));
            make.center.equalTo(self.titleView);
        }];
        view.alpha = 0.0;
        view;
    });

    self.navigationItem.titleView = self.titleView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarNavigationAction:)];
    
    
//    [[self.searchTextField rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x){
//        //x是textField对象
//        LPLOG(@"%@",x);
//    }];
    [[self.searchTextField rac_textSignal]subscribeNext:^(id x) {
        LPLOG(@"%@",x);
    }];
}
- (void)rightBarNavigationAction:(UIBarButtonItem*)sender{
    
}
//- (void)setupSubviewsLayout{
//    [super setupSubviewsLayout];
//
//}
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
