//
//  LPOrderTableViewController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/16.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPOrderTableViewController.h"

@interface LPOrderTableViewController ()

@end

@implementation LPOrderTableViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  
//    if (self.tableView.visibleCells.count ==0) {
//        LPLOG(@"");
//    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView.mj_header beginRefreshing];
//    });
    
//    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)initSubviews{
    [super initSubviews];
    self.blankView.blankType = LPBlankTypeOrder;
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
