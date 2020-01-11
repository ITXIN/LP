//
//  LPSegmentStyleManager.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/16.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPSegmentStyleManager : NSObject
+ (instancetype)sharedManager;
@property (nonatomic,strong) ZJSegmentStyle *segmentStyle;
@end
