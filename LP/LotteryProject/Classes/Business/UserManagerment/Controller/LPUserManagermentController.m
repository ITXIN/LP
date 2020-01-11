//
//  LPUserManagermentController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPUserManagermentController.h"
#import "LPUserManagermentCell.h"
#import "LPUserManagermentUserInfoController.h"
#import "LPUserManagermentSearchController.h"
#import "LPHUD.h"
@interface LPUserManagermentController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LPUserManagermentController
static NSString *useraManagermentCellIdentifier = @"useraManagermentCellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)initSubviews{
    [super initSubviews];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarNavigationAction:)];
//    [self.navigationItem.rightBarButtonItem setTitle:@""];
    self.navigationItem.rightBarButtonItem.width = 20;
    self.dataArr = [NSMutableArray arrayWithArray:@[@"用户数据",@"出票数据",@"派奖数据",@"取票数据"]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self tableViewRegisterClass:[LPUserManagermentCell class] forCellReuseIdentifier:useraManagermentCellIdentifier];
    //    @weakify(self);
    self.headerRefreshingBlock = ^{
        //        @strongify(self);
        //        NSInteger num = arc4random()%3;
        //        [self.dataArr removeAllObjects];
        //        for (NSInteger i = 0 ; i < num; i ++) {
        //            [self.dataArr addObject:[NSString stringWithFormat:@"orderTableView-%ld",i]];
        //        }
        
    };
    
}
- (void)rightBarNavigationAction:(UIBarButtonItem*)sender{
//    [LPHUD standardLPHUD].lpHUDType = LPHUDTypeVertical;
//    [[LPHUD standardLPHUD]showLotteryKindHUD];
    
    LPUserManagermentSearchController *searchVC = [[LPUserManagermentSearchController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

#pragma mark - 需要对不同的tableView 处理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.dataArr.count;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 15;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return [UIView new];
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LPUserManagermentUserInfoController *userInfoVC = [[LPUserManagermentUserInfoController alloc]init];
    [self.navigationController pushViewController:userInfoVC animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LPUserManagermentCell *cell = [tableView dequeueReusableCellWithIdentifier:useraManagermentCellIdentifier];
    if (cell) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if ([cell isKindOfClass:[LPDataStatisticsCell class]]) {
    //        LPDataStatisticsCell *dataStatisticsCell = (LPDataStatisticsCell*)cell;
    //        dataStatisticsCell.titleView.titleLab.text = self.dataArr[indexPath.section];
    //        dataStatisticsCell.dataStatisticsDetailBtnTypeBlock = ^(LPDataStatisticsDetailType type) {
    //            [self detailBtnAction:type];
    //        };
    //        [dataStatisticsCell setupDataWithSection:indexPath.section titleArr:self.titlesArr[indexPath.section]];
    //    }
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
