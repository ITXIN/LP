//
//  LPDataStatisticsController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPDataStatisticsController.h"
#import "LPDataStatisticsCell.h"
#import "LPDataStatisticsUserDataController.h"
@interface LPDataStatisticsController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *titlesArr;
@end

@implementation LPDataStatisticsController
static NSString *dataStatisticsCenterCellIdentifier = @"dataStatisticsCenterCellIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)initSubviews{
    [super initSubviews];
    NSArray *contentTitleArr1 = @[@"注册用户",@"投注总额",@"中奖总额"];
    NSArray *contentTitleArr2 = @[@"今日出票",@"本周出票",@"本月出票"];
    NSArray *contentTitleArr3 = @[@"今日派奖",@"本周派奖",@"本月派奖"];
    NSArray *contentTitleArr4 = @[@"今日取票",@"本周取票",@"本月取票"];
    self.titlesArr = [NSMutableArray arrayWithObjects:contentTitleArr1,contentTitleArr2,contentTitleArr3,contentTitleArr4, nil];
    self.dataArr = [NSMutableArray arrayWithArray:@[@"用户数据",@"出票数据",@"派奖数据",@"取票数据"]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self tableViewRegisterClass:[LPDataStatisticsCell class] forCellReuseIdentifier:dataStatisticsCenterCellIdentifier];
    @weakify(self);
    self.headerRefreshingBlock = ^{
//        @strongify(self);
        //        NSInteger num = arc4random()%3;
        //        [self.dataArr removeAllObjects];
        //        for (NSInteger i = 0 ; i < num; i ++) {
        //            [self.dataArr addObject:[NSString stringWithFormat:@"orderTableView-%ld",i]];
        //        }
        
    };

  
    
}
#pragma mark - detailBtnAction
- (void)detailBtnAction:(LPDataStatisticsDetailType)type{
    LPLOG(@"----%ld",type);
    switch (type) {
        case LPDataStatisticsDetailTypeUserData:
        {
            LPDataStatisticsUserDataController *userDataVC = [[LPDataStatisticsUserDataController alloc]init];
//            userDataVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:userDataVC animated:YES];
            break;
        }
        case LPDataStatisticsDetailTypeTicketData:
        {
            break;
        }
        case LPDataStatisticsDetailTypeAwardData:
        {
            break;
        }
        case LPDataStatisticsDetailTypeTakeTicketData:
        {
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - 需要对不同的tableView 处理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
      return  150;
    }else{
        return 182;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LPDataStatisticsCell *cell = [tableView dequeueReusableCellWithIdentifier:dataStatisticsCenterCellIdentifier];
    if (cell) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
   
    return cell;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[LPDataStatisticsCell class]]) {
        LPDataStatisticsCell *dataStatisticsCell = (LPDataStatisticsCell*)cell;
        dataStatisticsCell.titleView.titleLab.text = self.dataArr[indexPath.section];
        dataStatisticsCell.dataStatisticsDetailBtnTypeBlock = ^(LPDataStatisticsDetailType type) {
            [self detailBtnAction:type];
        };
        [dataStatisticsCell setupDataWithSection:indexPath.section titleArr:self.titlesArr[indexPath.section]];
    }
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
