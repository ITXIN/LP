//
//  LPMultilineTextView.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/20.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPMultilineTextView.h"

@implementation LPMultilineTextView

- (void)initSubviews{
    [super initSubviews];
    self.labelArr = [NSMutableArray array];
    
}

- (void)setLineNumber:(NSInteger)lineNumber{
    if (lineNumber != _lineNumber) {
        _lineNumber = lineNumber;
        [self initMultiLineSubviews];
    }
}

- (void)initMultiLineSubviews{
    [self.labelArr removeAllObjects];
    for (UIView *view in self.bgView.subviews) {
//        if ([view isKindOfClass:[UILabel class]]) {
            [view removeFromSuperview];
            LPLOG(@"error delete %@",view);
//        }else{
//
//        }
    }
   
    
    UILabel *preLab = nil;
    for (NSInteger i = 0 ; i < self.lineNumber; i ++) {
        UILabel *lineLab = ({
            UILabel *label = [[UILabel alloc]init];
            [self.bgView addSubview:label];
            label.textAlignment = NSTextAlignmentCenter;
            dispatch_async(dispatch_get_main_queue(), ^{
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.bgView);
                    make.leading.trailing.equalTo(self.bgView);
                    if (i == 0) {
                        make.top.mas_equalTo(0);
                    }else{
                        if (i == 1) {
                            make.top.mas_equalTo(preLab.mas_bottom).offset(15);
                        }else{
                            make.top.mas_equalTo(preLab.mas_bottom).offset(10);
                        }
                        
                    }
                }];
            });
            preLab = label;
            label;
        });
        [self.labelArr addObject:lineLab];
    }
    
    self.lineView = ({
        UIView *view = [[UIView alloc]init];
        [self.bgView addSubview:view];
        view.backgroundColor = [UIColor lpGrayLineColor];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(1);
            make.right.mas_equalTo(-1);
            make.centerY.equalTo(self.bgView);
        }];
        view;
    });
    
    
}

- (void)setupMultilineWithRow:(NSInteger)row font:(UIFont*)font textColor:(UIColor*)color{
    if (self.labelArr.count > 0 && row < self.labelArr.count && row >= 0) {
        UILabel *rowLabel = self.labelArr[row];
        if (color) {
            rowLabel.textColor = color;
        }
        if (font) {
            rowLabel.font = font;
        }
    }
}

- (void)setupMultilineTextWithRow:(NSInteger)row text:(NSString*)text{
    if (self.labelArr.count > 0 && row < self.labelArr.count && row >= 0) {
        UILabel *rowLabel = self.labelArr[row];
        if (text) {
            rowLabel.text = text;
        }
    }
}
- (void)setupSubviewsLayout{
    [super setupSubviewsLayout];
    
}
@end
