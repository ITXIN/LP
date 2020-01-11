//
//  LPPersonalCenterHeaderView.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/19.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseView.h"
#import "LPDoubleLineView.h"
@interface LPPersonalCenterHeaderView : LPBaseView
@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UIButton *authStatusBtn;

@property (nonatomic,strong) LPDoubleLineView *amoutView;
@property (nonatomic,strong) LPDoubleLineView *gmosaicGoldView;
@end
