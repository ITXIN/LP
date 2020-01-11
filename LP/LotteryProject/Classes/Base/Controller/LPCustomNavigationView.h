//
//  LPCustomNavigationView.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/19.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseView.h"
typedef void (^LPCustomNavigationLeftItemBlock)(void);
typedef void (^LPCustomNavigationRightItemBlock)(void);
@interface LPCustomNavigationView : LPBaseView
@property (nonatomic,copy) LPCustomNavigationLeftItemBlock customNavigationLeftItemBlock;
@property (nonatomic,copy) LPCustomNavigationRightItemBlock customNavigationRightItemBlock;
@property (nonatomic,strong) UIButton *leftItemBtn;
@property (nonatomic,strong) UIButton *rightItemBtn;
@property (nonatomic,strong) UILabel *titleLab;

@end
