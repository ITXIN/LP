//
//  LPBaseTableViewCell.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/14.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPBaseTableViewCell : UITableViewCell
@property (nonatomic,strong) UIView *bgView;
- (void)initSubviews;
- (void)setupSubviewsLayout;
@end
