//
//  LPBaseTableViewController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/14.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseTableViewController.h"

@interface LPBaseTableViewController ()
@property(nonatomic,strong)NSString *numberRowStr;
@end

@implementation LPBaseTableViewController

- (LPBlankView *)blankView{
    if (!_blankView) {
//        _blankView = [[LPBlankView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 540/3+70)];
         _blankView = [[LPBlankView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    }
    return _blankView;
}
-(instancetype)initWithFrame:(CGRect)frame tableViewDelegate:(id)delegate{
    self = [super init];
    if (self){
        self.view.frame = frame;
        self.tableView.delegate = delegate;
        self.tableView.dataSource = delegate;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tableViewRegisterClass:(nullable Class)cellClass forCellReuseIdentifier:(NSString *)identifier{
    [self.tableView registerClass:cellClass forCellReuseIdentifier:identifier];
}

- (void)initSubviews{
    [super initSubviews];
    self.dataArr = [NSMutableArray array];
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = YES;
        tableView.backgroundColor = [UIColor clearColor];
        [self.bgView addSubview:tableView];
        
        tableView;
    });
    //    @weakify(self);
    //    self.tableView.mj_header.endRefreshingCompletionBlock = ^{
    //        @strongify(self);
    //        if (self.dataArr.count > 0) {
    //            self.isBlank = NO;
    //        }else{
    //            self.isBlank = YES;
    //        }
    //    };
    
}
- (void)setHeaderRefreshingBlock:(LPRefreshComponentRefreshingBlock)headerRefreshingBlock{
    _headerRefreshingBlock = headerRefreshingBlock;
    @weakify(self);
    if (headerRefreshingBlock) {
        MJRefreshNormalHeader *orderTVHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self);
            if (self.headerRefreshingBlock) {
                self.headerRefreshingBlock();
            }
            [self.tableView.mj_header endRefreshing];
            [self setupShowBlank];
            [self.tableView reloadData];
//            LPLOG(@"%ld %ld",self.dataArr.count,self.tableView.visibleCells.count);
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.dataArr.count > self.tableView.visibleCells.count) {
                    self.tableView.mj_footer.hidden = NO;
//                    LPLOG(@"foot show");
                }else{
//                    LPLOG(@"foot hidden");
                    self.tableView.mj_footer.hidden = YES;
                }
            });
            
        }];
        orderTVHeader.lastUpdatedTimeLabel.hidden = YES;
        self.tableView.mj_header = orderTVHeader;
        
    }
}
- (void)setFooterRefreshingBlock:(LPRefreshComponentRefreshingBlock)footerRefreshingBlock{
    _footerRefreshingBlock = footerRefreshingBlock;
    @weakify(self);
    if (footerRefreshingBlock) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            @strongify(self);
            if (self.footerRefreshingBlock) {
                self.footerRefreshingBlock();
            }
            [self.tableView.mj_footer endRefreshing];
            [self setupShowBlank];
            [self.tableView reloadData];
            
        }];
        [self.tableView.mj_footer beginRefreshing];
    }
}
- (void)setupShowBlank{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.dataArr.count > 0) {//不能移除，还有类型的需要处理
            self.blankView.hidden = YES;
        }else{
            self.blankView.hidden = NO;
            [self.tableView addSubview:self.blankView];
        }
    });
}
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
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

