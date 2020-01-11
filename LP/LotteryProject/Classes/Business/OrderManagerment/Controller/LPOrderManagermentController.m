//
//  LPOrderManagermentController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPOrderManagermentController.h"
#import "LPOrderDetailController.h"
#import "LPLoginRootController.h"
#import "LPOrderTableViewController.h"
#import "LPOrderCell.h"
#import "LPHUD.h"
#import "LPFollowOrderCell.h"
@interface LPOrderManagermentController ()<ZJScrollPageViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic) NSArray<NSString *> *titles;
@property(strong, nonatomic) NSArray<UIViewController *> *childVcs;
@property (nonatomic,strong) ZJScrollPageView *scrollPageView;
@property (nonatomic,strong) LPOrderTableViewController *orderTableView;
@property (nonatomic,strong) LPOrderTableViewController *tagetherTableView;
@property (nonatomic,strong) LPOrderTableViewController *followOrderTableView;

@end

@implementation LPOrderManagermentController

static NSString *orderCellIdentifier = @"orderCellIdentifier";
static NSString *tagetherCellIdentifier = @"tagetherCellIdentifier";
static NSString *followOrderCellIdentifier = @"followOrderCellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
- (void)initSubviews{
    [super initSubviews];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_filter"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarNavigationBack:)];
    ZJSegmentStyle *style = [[LPSegmentStyleManager sharedManager] segmentStyle];
    self.titles = @[@"订单",
                    @"合买",
                    @"跟单",
                    ];
    // 初始化
    _scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kStatusBarAndNavigationBarAndTabbarHeightHeight) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    [self.bgView addSubview:_scrollPageView];
    [self.scrollPageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.bgView);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    
}
#pragma mark -
- (void)rightBarNavigationBack:(UIBarButtonItem*)sender{
//    if (![LPHUD standardLPHUD].isShowing) {
//        [LPHUD standardLPHUD].lpHUDType = LPHUDTypeHorizontal;
//        [[LPHUD standardLPHUD]showLotteryKindHUD];
//    }else{
//        [[LPHUD standardLPHUD]hiddenLotteryKindHUD];
//    }
    
    
    LPOrderDetailController *orderDetailVC = [[LPOrderDetailController alloc]init];
    [self.navigationController pushViewController:orderDetailVC animated:YES];
}

#pragma mark -
- (void)setupTableView{
    @weakify(self);
    if (self.orderTableView) {
        self.orderTableView.headerRefreshingBlock = ^{
            @strongify(self);
            NSInteger num = arc4random()%3;
            [self.orderTableView.dataArr removeAllObjects];
            for (NSInteger i = 0 ; i < num; i ++) {
                [self.orderTableView.dataArr addObject:[NSString stringWithFormat:@"orderTableView-%ld",i]];
            }
            
        };
        
        self.orderTableView.footerRefreshingBlock = ^{
            @strongify(self);
            NSInteger num = arc4random()%3;
            NSInteger preNum = self.orderTableView.dataArr.count;
            for (NSInteger i = 0 ; i < num; i ++) {
                [self.orderTableView.dataArr addObject:[NSString stringWithFormat:@"orderTableView-%ld",i+preNum+1]];
            }
        };
    }
    
    if (self.tagetherTableView) {
        self.tagetherTableView.headerRefreshingBlock = ^{
            @strongify(self);
            NSInteger num = arc4random()%30;
            [self.tagetherTableView.dataArr removeAllObjects];
            for (NSInteger i = 0 ; i < num; i ++) {
                [self.tagetherTableView.dataArr addObject:[NSString stringWithFormat:@"tagetherTableView-%ld",num]];
            }
        };
    }
    
    if (self.followOrderTableView) {
        self.followOrderTableView.headerRefreshingBlock = ^{
            @strongify(self);
            NSInteger num = arc4random()%30;
            [self.followOrderTableView.dataArr removeAllObjects];
            for (NSInteger i = 0 ; i < num; i ++) {
                [self.followOrderTableView.dataArr addObject:[NSString stringWithFormat:@"followOrderTableView-%ld",num]];
            }
        };
    }
    
}

#pragma mark - ZJScrollPageViewDelegate
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    LPOrderTableViewController<ZJScrollPageViewChildVcDelegate> *childVc = (LPOrderTableViewController*)reuseViewController;
    if (!childVc) {
        childVc = [[LPOrderTableViewController alloc] initWithFrame:self.view.bounds tableViewDelegate:self];
        
    }
    if (index == 0) {
        if (!self.orderTableView) {
            self.orderTableView = childVc;
            [childVc tableViewRegisterClass:[LPOrderCell class] forCellReuseIdentifier:orderCellIdentifier];
        }
    }else if (index == 1){
        if (!self.tagetherTableView) {
            self.tagetherTableView = childVc;
            [childVc tableViewRegisterClass:[LPOrderCell class] forCellReuseIdentifier:orderCellIdentifier];
        }
    }else{
        if (!self.followOrderTableView) {
            self.followOrderTableView = childVc;
            [childVc tableViewRegisterClass:[LPFollowOrderCell class] forCellReuseIdentifier:followOrderCellIdentifier];
        }
    }
    [self setupTableView];
    return childVc;
}


- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}
#pragma mark - 需要对不同的tableView 处理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LPOrderDetailController *orderDetailVC = [[LPOrderDetailController alloc]init];
    [self.navigationController pushViewController:orderDetailVC animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    if ([tableView isEqual:self.orderTableView.tableView]) {
        return  self.orderTableView.dataArr.count;
    }else if ([tableView isEqual:self.followOrderTableView.tableView]){
        return  self.followOrderTableView.dataArr.count;
    }else{
        return self.tagetherTableView.dataArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([tableView isEqual:self.orderTableView.tableView]) {
        LPOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:orderCellIdentifier];
        cell.backgroundColor = [UIColor whiteColor];
        cell.contentLab.text = self.orderTableView.dataArr[indexPath.row];
        return cell;
    }else if ([tableView isEqual:self.tagetherTableView.tableView]){
        LPOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:orderCellIdentifier];
        cell.backgroundColor = [UIColor whiteColor];
        cell.contentLab.text = self.tagetherTableView.dataArr[indexPath.row];
        return cell;
    }else{
        LPFollowOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:followOrderCellIdentifier];
        return cell;
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

