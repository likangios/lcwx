//
//  BookShelfCollectionViewCell.m
//  lcwx
//
//  Created by luck on 2018/1/14.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "BookShelfCollectionViewCell.h"

@interface BookShelfCollectionViewCell ()
//封面
@property(nonatomic,strong) UIImageView *coverImageView;
//推荐
@property(nonatomic,strong) UIImageView *recommonImageView;

/**
 标题
 */
@property(nonatomic,strong) UILabel *titleLabel;

/**
 状态 红点
 */
@property(nonatomic,strong) UIView *stateView;


@end

@implementation BookShelfCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubView];
    }
    return self;
}
- (void)creatSubView{
    [self.contentView addSubview:self.coverImageView];
    [self.contentView addSubview:self.recommonImageView];
    [self.contentView addSubview:self.stateView];
    [self.contentView addSubview:self.titleLabel];

    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.equalTo(self.coverImageView.mas_width).multipliedBy(4/3.0);
    }];
    [self.recommonImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(1);
    }];
    [self.stateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(1);
        make.top.equalTo(self.coverImageView.mas_bottom).offset(kAUTOSCALE_WIDTH(17));
        make.size.mas_equalTo(kAUTOSCALE_WIDTH(0));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.stateView.mas_right).offset(2);
        make.top.equalTo(self.coverImageView.mas_bottom).offset(kAUTOSCALE_WIDTH(15));
        make.right.mas_equalTo(0);
    }];
    
}
- (void)setModel:(BookShelfHotModel *)model{
    _model = model;
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:[MSUntil LCImageUrlWithImage:model.cover]]];
    self.titleLabel.text = _model.readTxt;
    
}
- (UIImageView *)coverImageView{
    if (!_coverImageView) {
        _coverImageView = [UIImageView new];
        _coverImageView.layer.borderColor = lineColor.CGColor;
        _coverImageView.layer.borderWidth = 1.0;
        _coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _coverImageView;
}
- (UIImageView *)recommonImageView{
    if (!_recommonImageView) {
        _recommonImageView = [UIImageView new];
        _recommonImageView.image = [UIImage imageNamed:@"tj_cion_29x29_"];
        _recommonImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _recommonImageView;
}
- (UIView *)stateView{
    if (!_stateView) {
        _stateView = [UIView new];
        _stateView.layer.cornerRadius = kAUTOSCALE_WIDTH(4.0);
    }
    return _stateView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}















@end
