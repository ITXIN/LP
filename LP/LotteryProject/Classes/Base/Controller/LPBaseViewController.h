//
//  LPBaseViewController.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPBaseViewController : UIViewController<ZJScrollPageViewChildVcDelegate>
@property (nonatomic,strong) UIView *bgView;

- (void)initSubviews;
- (void)leftBarNavigationBack:(UIBarButtonItem*)sender;
- (void)setupSubviewsLayout;
- (void)restoreRootViewController:(UIViewController *)rootViewController;
@end
