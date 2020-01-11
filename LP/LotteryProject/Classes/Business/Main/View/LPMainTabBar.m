//
//  LPMainTabBar.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/24.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPMainTabBar.h"

@implementation LPMainTabBar

- (void)setFrame:(CGRect)frame{
    
    if (self.superview &&CGRectGetMaxY(self.superview.bounds) !=CGRectGetMaxY(frame)) {
        frame.origin.y =CGRectGetHeight(self.superview.bounds) -CGRectGetHeight(frame);
    }
    [super setFrame:frame];
}

#pragma mark - Initial Methods
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.translucent = false;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
