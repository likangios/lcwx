//
//  NavBarPopMenuView.m
//  lcwx
//
//  Created by macdev on 2018/1/15.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "NavBarPopMenuView.h"

@interface NavBarPopMenuView ()

@property (nonatomic,strong) QMUIPopupMenuView *menuView;
@end

@implementation NavBarPopMenuView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self bk_addEventHandler:^(id sender) {
            [self.menuView hideWithAnimated:YES completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        } forControlEvents:UIControlEventTouchUpInside];
        [self.menuView layoutWithTargetRectInScreenCoordinate:CGRectMake(0, 0, 60, 80)];
        [self.menuView showWithAnimated:YES];

    }
    return self;
}
- (QMUIPopupMenuView *)menuView{
    if (!_menuView) {
        __weak typeof(self)weakSelf = self;
        _menuView = [[QMUIPopupMenuView alloc]init];
        _menuView.shouldShowItemSeparator = YES;
        _menuView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.75];
        _menuView.separatorColor = [UIColor colorWithHexString:@"e2e2e2"];
        _menuView.itemTitleFont = [UIFont systemFontOfSize:14];
        _menuView.itemHeight = 37;
        _menuView.distanceBetweenTargetRect = -15;
        _menuView.maximumWidth = kAUTOSCALE_WIDTH(120);
        _menuView.imageMarginRight = 9;
        _menuView.textLabel.textColor = [UIColor grayColor];
        _menuView.itemHighlightedBackgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        _menuView.maskViewBackgroundColor = [UIColor blackColor];
        QMUIPopupMenuItem *share = [QMUIPopupMenuItem  itemWithImage:[UIImage imageNamed:@"ydms_icon_18_17x17_"] title:@"更新排序" handler:^{
            [weakSelf.menuView hideWithAnimated:YES];
            
        }];
        [share.button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        QMUIPopupMenuItem *report = [QMUIPopupMenuItem  itemWithImage:[UIImage imageNamed:@"ydms_icon_16x16_"] title:@"封面模式" handler:^{
            [weakSelf.menuView hideWithAnimated:YES];
        }];
        [report.button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

        QMUIPopupMenuItem *manager = [QMUIPopupMenuItem  itemWithImage:[UIImage imageNamed:@"plgl_icon_15x17_"] title:@"批量管理" handler:^{
            [weakSelf.menuView hideWithAnimated:YES];
        }];
        [manager.button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

        _menuView.items = @[share,report,manager];
    }
    return _menuView;
}

@end
