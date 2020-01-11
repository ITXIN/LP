//
//  LPMainViewController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPMainViewController.h"
#import "LPOrderManagermentController.h"
#import "LPUserManagermentController.h"
#import "LPDataStatisticsController.h"
#import "LPPersonalCenterController.h"
#import "LPBaseNavigationController.h"
#import "LPMainTabBar.h"
@interface LPMainViewController ()

@end

@implementation LPMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTabbarItems];
}
- (void)initTabbarItems{
    [self setValue:[[LPMainTabBar alloc]init] forKey:@"tabBar"];//解决iPhoneX push tabbar 
    [self.tabBar setBackgroundImage:[LPProjectHelper imageFromColor:[UIColor whiteColor] rect:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)]];
//    [self.tabBar setShadowImage:[UIImage new]];
    LPOrderManagermentController *orderMVC = [[LPOrderManagermentController alloc]init];
    LPUserManagermentController *userMVC = [[LPUserManagermentController alloc]init];
    LPDataStatisticsController *dataMVC = [[LPDataStatisticsController alloc]init];
    LPPersonalCenterController *personalCenterMVC = [[LPPersonalCenterController alloc]init];
    
    NSArray *imagesNormalArr = @[@"tab_order_nor",@"tab_user_nor",@"tab_data_nor",@"tab_mine_nor"];
    NSArray *imagesSeletedArr = @[@"tab_order_pre",@"tab_user_pre",@"tab_data_pre",@"tab_mine_pre"];
    NSArray *tabBarTitlesArr = @[@"订单管理",@"用户管理",@"数据统计",@"个人中心"];

    NSArray *controllersArr = @[orderMVC,userMVC,dataMVC,personalCenterMVC];
    NSMutableArray *navigationsArr = [NSMutableArray array];
    for (NSInteger i = 0 ; i < tabBarTitlesArr.count; i ++) {
        LPBaseNavigationController *navigationVC = [[LPBaseNavigationController alloc]initWithRootViewController:controllersArr[i]];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:tabBarTitlesArr[i] image:[UIImage imageNamed:imagesNormalArr[i]] selectedImage:[UIImage imageNamed:imagesSeletedArr[i]]];
        tabBarItem.tag = 1000 + i;
        navigationVC.tabBarItem = tabBarItem;
        if (i != 3) {
            [(LPBaseViewController*)controllersArr[i] setTitle:tabBarTitlesArr[i]];
        }
        
        [navigationsArr addObject:navigationVC];
    }
    [self setViewControllers:navigationsArr animated:YES];
    
    
    UIImageView *shadowImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbar_shadow"]];
    shadowImageView.frame = CGRectMake(0, -5, kScreenWidth, 5);
    self.tabBar.shadowImage = shadowImageView.image;
//    [self.tabBar addSubview:shadowImageView];
    
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
