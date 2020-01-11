//
//  LPDataStatisticsCell.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/20.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseTableViewCell.h"
#import "LPDataStatisticsTitleView.h"
#import "LPMultilineTextView.h"
typedef NS_ENUM(NSInteger,LPDataStatisticsDetailType) {
    LPDataStatisticsDetailTypeUserData = 1000,
    LPDataStatisticsDetailTypeTicketData,//出票
    LPDataStatisticsDetailTypeAwardData,//派奖
    LPDataStatisticsDetailTypeTakeTicketData,//取票
};
typedef void (^LPDataStatisticsDetailTypeBlock)(LPDataStatisticsDetailType type);
@interface LPDataStatisticsCell : LPBaseTableViewCell
@property (nonatomic,strong) LPDataStatisticsTitleView *titleView;
@property (nonatomic,strong) LPMultilineTextView *leftContenView;
@property (nonatomic,strong) LPMultilineTextView *midContenView;
@property (nonatomic,strong) LPMultilineTextView *rightContenView;
//@property (nonatomic,assign) NSInteger numberLine;
@property (nonatomic,strong) UIButton *detailBtn;
@property (nonatomic,copy) LPDataStatisticsDetailTypeBlock dataStatisticsDetailBtnTypeBlock;
@property (nonatomic,assign) LPDataStatisticsDetailType dataStatisticsDetailType;
- (void)setupDataWithSection:(NSInteger)section titleArr:(NSArray*)titleArr;
@end
