//
//  LPBaseNavigationController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseNavigationController.h"

@interface LPBaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation LPBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.navigationBar.translucent = NO;
    self.navigationBar.backIndicatorImage = [UIImage imageNamed:@"icon_navigation_back"];
    self.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"icon_navigation_back"];

    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    UIColor* color = [UIColor whiteColor];
    NSDictionary* dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dict;

    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundImage:[LPProjectHelper imageFromColor:[UIColor lpThemeColor] rect:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)] forBarMetrics:UIBarMetricsDefault];
    
}
- (UIStatusBarStyle )preferredStatusBarStyle
{
    return self.topViewController.preferredStatusBarStyle;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
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
