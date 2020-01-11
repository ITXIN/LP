//
//  LPMultilineTextView.h
//  LotteryProject
//
//  Created by avazuholding on 2017/12/20.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPBaseView.h"

@interface LPMultilineTextView : LPBaseView
@property (nonatomic,strong) NSMutableArray *labelArr;
@property (nonatomic,assign) NSInteger lineNumber;
@property (nonatomic,strong) UIView *lineView;

- (void)setupMultilineWithRow:(NSInteger)row font:(UIFont*)font textColor:(UIColor*)color;
- (void)setupMultilineTextWithRow:(NSInteger)row text:(NSString*)text;
@end
