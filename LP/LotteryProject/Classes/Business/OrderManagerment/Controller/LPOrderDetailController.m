//
//  LPOrderDetailController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPOrderDetailController.h"

@interface LPOrderDetailController ()

@end

@implementation LPOrderDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//   [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)initSubviews{
    [super initSubviews];
    self.title = @"订单详情";
//    UIButton *detaiBtn = ({
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self.bgView addSubview:btn];
//        [btn addTarget:self action:@selector(detailAction:) forControlEvents:UIControlEventTouchUpInside];
//        [btn setTitle:@"详情" forState:UIControlStateNormal];
//        [btn setBackgroundColor:[UIColor redColor]];
//        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self.bgView);
//        }];
//        btn;
//    });
}
#pragma mark -
- (void)detailAction:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
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
