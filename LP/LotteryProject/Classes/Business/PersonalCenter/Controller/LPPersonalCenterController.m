//
//  LPPersonalCenterController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPPersonalCenterController.h"
#import "LPPersonalCenterHeaderView.h"
#import "LPCustomNavigationView.h"
#import "LPPersonalCenterCell.h"
#import "LPOrderDetailController.h"
@interface LPPersonalCenterController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) LPPersonalCenterHeaderView *headerView;
@property (nonatomic,strong) LPCustomNavigationView *customNavigationView;
@end

@implementation LPPersonalCenterController
static NSString *personalCenterCellIdentifier = @"personalCenterCellIdentifier";
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initSubviews{
    [super initSubviews];
//    dispatch_async(dispatch_get_main_queue(), ^{
    
        self.customNavigationView.backgroundColor = [UIColor clearColor];
//    });
    self.dataArr = [NSMutableArray arrayWithArray:@[@"未出票",@"派奖",@"提现",@"充值",@"我的推广助手",@"下载我的彩民端",@"彩种管理",@"出票管理",@"投注查询",@"使用教程",@"账户明细",@"设置"]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self tableViewRegisterClass:[LPPersonalCenterCell class] forCellReuseIdentifier:personalCenterCellIdentifier];
    self.headerView = ({
        LPPersonalCenterHeaderView *view = [[LPPersonalCenterHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 263+(kiPhoneX? kNavigationBarHeight:0))];
        view.backgroundColor = [UIColor whiteColor];
        
        view;
    });
    
    self.customNavigationView = ({
        LPCustomNavigationView *view = [[LPCustomNavigationView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kStatusBarAndNavigationBarHeight)];
        view.backgroundColor = [UIColor clearColor];
        view.titleLab.text = @"";
        [self.bgView addSubview:view];
        view;
    });
    @weakify(self);
    self.headerRefreshingBlock = ^{
        @strongify(self);
//        NSInteger num = arc4random()%3;
//        [self.dataArr removeAllObjects];
//        for (NSInteger i = 0 ; i < num; i ++) {
//            [self.dataArr addObject:[NSString stringWithFormat:@"orderTableView-%ld",i]];
//        }
        
    };
    self.tableView.tableHeaderView = self.headerView;
    self.customNavigationView.customNavigationLeftItemBlock = ^{
        LPLOG(@"customNavigationLeftItemBlock");
        @strongify(self);
        LPOrderDetailController *orVC = [[LPOrderDetailController alloc]init];
        [self.navigationController pushViewController:orVC animated:YES];
    };
    self.customNavigationView.customNavigationRightItemBlock = ^{
        LPLOG(@"customNavigationRightItemBlock");
    };
    
}
#pragma mark -
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    
    CGFloat a  = contentOffsetY*1/kStatusBarAndNavigationBarHeight;
    //    RGB(77, 139, 217)
    CGFloat r = contentOffsetY*77/kStatusBarAndNavigationBarHeight;
    CGFloat g = contentOffsetY*139/kStatusBarAndNavigationBarHeight;
    CGFloat b = contentOffsetY*217/kStatusBarAndNavigationBarHeight;

    if (contentOffsetY > kStatusBarAndNavigationBarHeight) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (contentOffsetY >= 100) {
                self.customNavigationView.titleLab.text = @"财付通";
            }
            self.customNavigationView.backgroundColor = [UIColor lpThemeColor];
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
//            LPLOG(@"a %lf r%lf g%lf b%lf",a,r,g,b);
            self.customNavigationView.backgroundColor = [RGB(r, g, b) colorWithAlphaComponent:a];
            self.customNavigationView.titleLab.alpha = a;
        });
    }
}
#pragma mark - 需要对不同的tableView 处理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.001;
    }else{
        return 15;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LPPersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCenterCellIdentifier];
    if (self.dataArr.count > 0) {
         cell.cellType = LPPCBaseCellTypeLeftTitleAndImage;
        cell.leftTitleLab.text = [NSString stringWithFormat:@"%@",self.dataArr[indexPath.row+indexPath.section*4]];
        cell.leftImageView.image = [UIImage imageNamed:@"icon_paijiang"];
        cell.rightTitleLab.text = [NSString stringWithFormat:@"%@",self.dataArr[indexPath.row+indexPath.section*4]];
    }
    return cell;
    
}

- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
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
