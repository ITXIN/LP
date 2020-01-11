//
//  LPBaseTableViewController.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/14.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseViewController.h"
/** 进入刷新状态的回调 */
typedef void (^LPRefreshComponentRefreshingBlock)(void);
/** 开始刷新后的回调(进入刷新状态后的回调) */
typedef void (^LPRefreshComponentbeginRefreshingCompletionBlock)(void);
/** 结束刷新后的回调 */
typedef void (^LPRefreshComponentEndRefreshingCompletionBlock)(void);

@interface LPBaseTableViewController : LPBaseViewController<ZJScrollPageViewChildVcDelegate>
@property (nonatomic,strong) UITableView * _Nullable tableView;
@property (nonatomic,strong) NSMutableArray * _Nonnull dataArr;
@property (nonatomic,strong) LPBlankView * _Nullable blankView;

@property (nonatomic,copy) LPRefreshComponentRefreshingBlock _Nullable headerRefreshingBlock;
@property (nonatomic,copy) LPRefreshComponentRefreshingBlock _Nullable footerRefreshingBlock;
-(instancetype _Nullable )initWithFrame:(CGRect)frame tableViewDelegate:(id _Nonnull )delegate;
- (void)tableViewRegisterClass:(nullable Class)cellClass forCellReuseIdentifier:(NSString *_Nullable)identifier;
@end

