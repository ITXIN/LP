//
//  LPBaseViewController.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/12.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseViewController.h"
#import "LPLoginRootController.h"
#import "LPBaseNavigationController.h"
@interface LPBaseViewController ()
@property (nonatomic,strong)LPBaseNavigationController *navgationVC;
@property (nonatomic,weak)id interactivePopGestureRecognizer_delegate;
@end

@implementation LPBaseViewController

- (void)setTitle:(NSString *)title{
    [super setTitle:title];
    if (self.navigationController.viewControllers.count > 1) {
        self.navgationVC.visibleViewController.title = title;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.navigationController.viewControllers.count > 1) {
        [self setupNavi];
    }
    
    [self initSubviews];
    [self setupSubviewsLayout];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupViewAppear:animated];
}

- (void)setupViewAppear:(BOOL)animated{
    self.interactivePopGestureRecognizer_delegate = self.navigationController.interactivePopGestureRecognizer.delegate;
    [self.navigationController.interactivePopGestureRecognizer setDelegate:nil];
    if (self.navigationController.viewControllers.count > 1) {
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController setNavigationBarHidden:YES animated:animated];
        
    }else{
        self.hidesBottomBarWhenPushed = NO;
        
    }
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setupViewAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.interactivePopGestureRecognizer setDelegate:self.interactivePopGestureRecognizer_delegate];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}
- (void)setupNavi{
    UIViewController *root = [UIViewController new];
    self.navgationVC = [[LPBaseNavigationController alloc] init];
    [self.navgationVC pushViewController:root animated:YES];
    root.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    root.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"icon_navigation_back"];;
    
    
    self.navgationVC.view.frame = self.view.bounds;
//    self.navgationVC.view.backgroundColor = [UIColor redColor];
//    self.navgationVC.visibleViewController.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.navgationVC.view];
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initSubviews{
    self.bgView = ({
        UIView *view = [[UIView alloc]init];
        if (self.navigationController.viewControllers.count > 1) {
            [self.navgationVC.visibleViewController.view addSubview:view];
        }else{
            [self.view addSubview:view];
        }
        
        view.backgroundColor = [UIColor lpGrayBgColor];
        view;
    });
    
}



// 登陆后淡入淡出更换rootViewController
- (void)restoreRootViewController:(UIViewController *)rootViewController
{
    typedef void (^Animation)(void);
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    if ([rootViewController isKindOfClass:[LPLoginRootController class]]) {
        LPBaseNavigationController *navc = [[LPBaseNavigationController alloc]initWithRootViewController:rootViewController];
        rootViewController = navc;
    }
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
    };
    
    [UIView transitionWithView:window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}
#pragma mark -
- (void)leftBarNavigationBack:(UIBarButtonItem*)sender{
    
}
#pragma mark -
- (void)setupSubviewsLayout{
    if (self.navigationController.viewControllers.count > 1) {
        [self.navgationVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.navgationVC.visibleViewController.view);
        }];
    }else{
        
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    
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
