//
//  LPNetworkManager.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/14.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LP_ERROR_DOMAIN @"com.opg"
#define LP_ERROR_USER_INFO_DESCRIPTION @"OPG_ERROR_USER_INFO_DESCRIPTION"
#define LP_ERROR_CODE_NETWORK_NOT_REACHABLE 1001

@interface LPNetworkManager : NSObject
+ (instancetype)sharedManager;
- (RACSignal *)post:(NSString *)path
           parameter:(NSDictionary *)parameter
        showProgress:(BOOL)show;
@end
