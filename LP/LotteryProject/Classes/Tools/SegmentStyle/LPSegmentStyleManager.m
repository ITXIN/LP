//
//  LPSegmentStyleManager.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/16.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPSegmentStyleManager.h"

@implementation LPSegmentStyleManager
+ (instancetype)sharedManager
{
    static LPSegmentStyleManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LPSegmentStyleManager alloc] init];
        //必要的设置, 如果没有设置可能导致内容显示不正常
        manager.segmentStyle = [[ZJSegmentStyle alloc] init];
        //显示滚动条
        manager.segmentStyle.showLine = YES;
        // 颜色渐变
        manager.segmentStyle.gradualChangeTitleColor = YES;
        manager.segmentStyle.scrollTitle = NO;
        manager.segmentStyle.scrollLineColor = [UIColor lpThemeColor];
        manager.segmentStyle.selectedTitleColor = [UIColor lpThemeColor];
        
    });
    return manager;
}
@end
