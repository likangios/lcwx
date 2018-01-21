//
//  LCSegmentView.m
//  DouBo_Live
//
//  Created by macdev on 2018/1/15.
//  Copyright © 2018年 ngmob. All rights reserved.
//

#import "LCSegmentView.h"

#define underlineHeight     2
@interface LCSegmentView  ()

@property (nonatomic,strong) NSArray *titles;

@property (nonatomic,strong) UIView *mainView;

@property (nonatomic,strong) UIView *underLineView;

@end

@implementation LCSegmentView

- (instancetype)initWithFrame:(CGRect)frame WithTitles:(NSArray *)titles{
    self = [super initWithFrame:frame];
    if (self) {
        self.titles = titles;
        [self addSubview:self.mainView];
        [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        UIButton *lastBtn = nil;
        UIButton *firstBtn = nil;
        for (int i = 0; i<self.titles.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.tag = i+1;
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            [self.mainView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.mas_equalTo(0);
                if (lastBtn) {
                    make.left.equalTo(lastBtn.mas_right).offset(kAUTOSCALE_WIDTH(15));
                }
                else{
                make.left.mas_equalTo(0);
                }
                if (i == (self.titles.count - 1)) {
                    make.right.mas_equalTo(0);
                }
            }];
            if (i == 0) {
                firstBtn = btn;
            }
            [btn bk_addEventHandler:^(UIButton *sender) {
                if (self.btnClickBlock) {
                    self.btnClickBlock(sender.tag);
                }
                [self addUnderLineViewWithSuperView:sender];
            } forControlEvents:UIControlEventTouchUpInside];
            lastBtn = btn;
        }
        
        if (firstBtn) {
            [self addUnderLineViewWithSuperView:firstBtn];
        }
    }
    return self;
}
- (void)setDefaultIndex:(NSInteger)defaultIndex{
    UIButton *btn = [self.mainView viewWithTag:defaultIndex];
    [self addUnderLineViewWithSuperView:btn];
}
- (void)addUnderLineViewWithSuperView:(UIView *)superView{
    if (superView == self.underLineView.superview) {
        return;
    }
    [superView addSubview:self.underLineView];
    [self.underLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(superView);
        make.centerX.equalTo(superView);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(kAUTOSCALE_WIDTH(underlineHeight));
    }];
}
- (UIView *)underLineView{
    if (!_underLineView) {
        _underLineView = [UIView new];
        _underLineView.backgroundColor = mainColor_red;

    }
    return _underLineView;
}

- (UIView *)mainView{
    if (!_mainView) {
        _mainView = [UIView new];
    }
    return _mainView;
}

@end
