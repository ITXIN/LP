//
//  LPUserManagermentUserInfoController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/22.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPUserManagermentUserInfoController.h"
#import "LPUserManagermentUserInfoCell.h"
#import "LPUserManagermentUserInfoHeaderView.h"
@interface LPUserManagermentUserInfoController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIImageView *tableBgView;
@property (nonatomic,strong) LPUserManagermentUserInfoHeaderView *headerView;
@property (nonatomic,strong) UISwitch *switchBtn;
@property (nonatomic,strong) UILabel *transferDescripLab;
@end

@implementation LPUserManagermentUserInfoController


static NSString *useraManagermentCellIdentifier = @"useraManagermentCellIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)initSubviews{
    [super initSubviews];
    self.title = @"用户信息";
    self.dataArr = [NSMutableArray array];
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.bgView addSubview:self.scrollView];
//    self.scrollView.contentSize = CGSizeMake(0, kScreenHeight+kStatusBarAndNavigationBarHeight);
    self.scrollView.scrollEnabled = YES;
    self.tableBgView =  ({
        UIImageView *image = [[UIImageView alloc]init];
        image.image = [UIImage imageNamed:@"logo_bg"];
        image.frame = CGRectMake(0, 10, kScreenWidth, 470);
        [self.scrollView addSubview:image];
        image.userInteractionEnabled = YES;
        image;
    });

    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-20, 470) style:UITableViewStylePlain];
        [self.tableBgView addSubview:tableView];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = YES;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.bounces = NO;
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[LPUserManagermentUserInfoCell class] forCellReuseIdentifier:useraManagermentCellIdentifier];
        tableView;
    });
    
    
    self.headerView= ({
        LPUserManagermentUserInfoHeaderView *view = [[LPUserManagermentUserInfoHeaderView alloc]init];
        view.frame = CGRectMake(0, 0, kScreenWidth, 366/2);
        view.backgroundColor = [UIColor clearColor];
        view;
    });
    self.tableView.tableHeaderView = self.headerView;
    
    self.dataArr = [NSMutableArray arrayWithArray:@[@"用户名:",@"真实姓名:",@"绑定手机:",@"身份证号:",@"注册日期:",@"发布跟单:"]];
   
    self.transferBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.scrollView addSubview:btn];
        [btn setBackgroundImage:[LPProjectHelper imageFromColor:[UIColor lpThemeColor] rect:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)]forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"转账" forState:UIControlStateNormal];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        btn;
    });
    
    self.transferDescripLab = ({
        UILabel *label = [[UILabel alloc]init];
        [self.scrollView addSubview:label];
        label.textColor = [UIColor lpGrayTextColor];
        label.font = [UIFont systemFontOfSize:14];
        label.text = @"*转账金额将以彩金形式发放给彩民，不可提现。";
        label;
    });
    
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    self.scrollView.frame = self.bgView.bounds;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
    }];
    self.scrollView.contentSize = CGSizeMake(0, kScreenHeight+kStatusBarAndNavigationBarHeight);
}
#pragma mark -
- (void)btnAction:(UIButton*)sender{
    LPLOG(@"");
}
#pragma mark - switchAction
- (void)switchAction:(UISwitch*)sender{
    BOOL isButtonOn = [sender isOn];
    if (isButtonOn) {
        LPLOG(@"开");
    }else {
        LPLOG(@"关");
    }
    
}

#pragma mark -

- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-5);
    }];
    [self.transferBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(45);
        make.top.mas_equalTo(self.tableBgView.mas_bottom).offset(15);;
    }];
    [self.transferDescripLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.transferBtn);
        make.top.mas_equalTo(self.transferBtn.mas_bottom).offset(5);
        make.centerX.equalTo(self.bgView);
    }];
    
    
}
#pragma mark - 需要对不同的tableView 处理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LPUserManagermentUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:useraManagermentCellIdentifier];
    if (cell) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 5) {
            cell.rightTitleLab.hidden = YES;
            cell.bottomLineView.hidden = YES;
            if (!self.switchBtn) {
                self.switchBtn = [[UISwitch alloc]init];
                [cell.bgView addSubview:self.switchBtn];
                [self.switchBtn addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
                self.switchBtn.on = NO;
                [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(-10);
                    make.centerY.equalTo(cell.leftTitleLab);
                }];
            }
        }
    }
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
        if ([cell isKindOfClass:[LPUserManagermentUserInfoCell class]]) {
            LPUserManagermentUserInfoCell *userInfoCell = (LPUserManagermentUserInfoCell*)cell;
            userInfoCell.leftTitleLab.text = self.dataArr[indexPath.row];
            userInfoCell.rightTitleLab.text = self.dataArr[indexPath.row];
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
