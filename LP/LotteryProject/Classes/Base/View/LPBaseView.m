//
//  LPBaseView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/13.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseView.h"

@implementation LPBaseView
//不要在实现init了，initWithFrame会调用super init
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        [self initSubviews];
        [self setupSubviewsLayout];
    }
    return self;
}
- (void)initSubviews{
    self.bgView = ({
        UIView *view = [[UIView alloc]init];
        [self addSubview:view];
        
        view;
    });
    
}
- (void)setupSubviewsLayout{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
@end
