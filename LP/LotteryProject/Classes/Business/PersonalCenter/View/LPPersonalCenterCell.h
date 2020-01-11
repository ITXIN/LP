//
//  LPPersonalCenterCell.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/20.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseTableViewCell.h"
typedef NS_ENUM(NSInteger,LPPCBaseCellType) {
    LPPCBaseCellTypeLeftTitle = 1000,
    LPPCBaseCellTypeLeftTitleAndImage,
};
@interface LPPersonalCenterCell : LPBaseTableViewCell
@property (nonatomic,strong) UIView *bottomLineView;
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UILabel *leftTitleLab;
@property (nonatomic,strong) UILabel *rightTitleLab;
@property (nonatomic,strong) UIImageView *rightImageView;
@property (nonatomic,assign) LPPCBaseCellType cellType;

@end
