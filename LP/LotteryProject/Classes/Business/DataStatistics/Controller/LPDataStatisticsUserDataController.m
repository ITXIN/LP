//
//  LPDataStatisticsUserDataController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/26.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPDataStatisticsUserDataController.h"
#import "LPDataStatisticsUserDataHeaderView.h"
#import "LPDataStatisticsUserDataCell.h"
@interface LPDataStatisticsUserDataController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) LPDataStatisticsUserDataHeaderView *headerView;
@end

@implementation LPDataStatisticsUserDataController

static NSString *dataStatisticsUserDateCellIdentifier = @"dataStatisticsUserDateCellIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)initSubviews{
    [super initSubviews];

    self.title = @"用户信息";
    self.dataArr = [NSMutableArray arrayWithArray:@[@"用户数据",@"出票数据",@"派奖数据",@"取票数据"]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self tableViewRegisterClass:[LPDataStatisticsUserDataCell class] forCellReuseIdentifier:dataStatisticsUserDateCellIdentifier];
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

#pragma mark - 需要对不同的tableView 处理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.dataArr.count+50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 156;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (!self.headerView) {
        self.headerView = ({
            LPDataStatisticsUserDataHeaderView *view = [[LPDataStatisticsUserDataHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 156)];
            view;
        });
        
    }
    return self.headerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LPDataStatisticsUserDataCell *cell = [tableView dequeueReusableCellWithIdentifier:dataStatisticsUserDateCellIdentifier];
    if (cell) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
//    cell.textLabel.text = @"开发带伞了";
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
