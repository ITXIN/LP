//
//  LPDataStatisticsUserDataCell.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/27.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseTableViewCell.h"

@interface LPDataStatisticsUserDataCell : LPBaseTableViewCell
@property (nonatomic,strong) LPDoubleLineView *leftContenView;
@property (nonatomic,strong) LPDoubleLineView *midContenView;
@property (nonatomic,strong) LPDoubleLineView *rightContenView;
@property (nonatomic,strong) LPCommonLRLTitleView *titleView;

@end
