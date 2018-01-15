//
//  BaseViewController.m
//  DouBoPlayer
//
//  Created by macdev on 2017/3/20.
//  Copyright © 2017年 wby. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+ResizeImage.h"
#import "UIView+Common.h"

#define navBarTitleFont 30
#define navBarItemFont 14

@interface BaseViewController ()
@property (nonatomic,strong) UIView     *bottomLine;

@property (nonatomic,assign) NSUInteger viewDisplayCount;
@end

@implementation BaseViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [MobClick endLogPageView:[NSString stringWithFormat:@"%s",object_getClassName(self)]];

}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    if (@available(iOS 11.0,*)){
//        
//    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view bringSubviewToFront:self.customNavBar];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.viewDisplayCount += 1;
//    [MobClick beginLogPageView:[NSString stringWithFormat:@"%s",object_getClassName(self)]];
    NSLog(@"__%s__",object_getClassName(self));
    [[UIApplication sharedApplication] setStatusBarStyle:[self getStatusStyleWithClass]];
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate); //振动
    
}
- (UIStatusBarStyle)getStatusStyleWithClass{
    
    NSArray *classs = @[@"NGMMineViewController",@"NGMUserRoomController",@"GradeViewController",@"PlayerTableViewController",@"LiveViewController",@"NGMPreviewViewController"];
    for (NSString *name in classs) {
        if ([name isEqualToString:[NSString stringWithFormat:@"%s",object_getClassName(self)]]) {
            return UIStatusBarStyleLightContent;
        }
    }
    return UIStatusBarStyleDefault;
}

-(BOOL) IsFirstTimeDisplay
{
    if( self.viewDisplayCount == 1 )
        return YES;
    return NO;
}
- (void)hidenNavBar{
    self.customNavBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor randomColor];
    self.edgesForExtendedLayout  = UIRectEdgeNone;
    [self creatCustomNavBar];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    [self bottomLine];
    
}
- (UIButton *)leftItemBtn{
    if (!_leftItemBtn) {
        _leftItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftItemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _leftItemBtn.titleLabel.font = [UIFont systemFontOfSize:navBarItemFont];
        _leftItemBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_leftItemBtn addTarget:self action:@selector(leftItemAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.customNavBar addSubview:_leftItemBtn];
        
        [_leftItemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.height.mas_equalTo(16);
            make.width.mas_greaterThanOrEqualTo(44);
            
        }];
    }
    return _leftItemBtn;
}
- (UIButton *)rightItemBtn{
    if (!_rightItemBtn) {
        _rightItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightItemBtn.titleLabel.font = [UIFont systemFontOfSize:navBarItemFont];
        [_rightItemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [_rightItemBtn addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.customNavBar addSubview:_rightItemBtn];
        [_rightItemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.width.mas_greaterThanOrEqualTo(44);
            
        }];
    }
    return _rightItemBtn;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:navBarTitleFont];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.customNavBar addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.customNavBar).offset(10);
            make.centerX.equalTo(self.customNavBar);
            make.left.greaterThanOrEqualTo(self.customNavBar).offset(kAUTOSCALE_WIDTH(60));
            make.right.lessThanOrEqualTo(self.customNavBar).offset(-kAUTOSCALE_WIDTH(60));

        }];
    }
    return  _titleLabel;
}
- (void)creatCustomNavBar{
    _customNavBar = [[UIView alloc]init];
    _customNavBar.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    [self.view addSubview:_customNavBar];
    [_customNavBar mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.view);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(navBarH);
    }];

}

- (UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor colorWithHexString:@"e8e8e8"];
        [self.customNavBar addSubview:_bottomLine];
        [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.left.right.equalTo(self.customNavBar);
            make.height.mas_equalTo(0.5);
        }];

    }
    return _bottomLine;
}

- (void)hidenBottomLine
{
    self.bottomLine.hidden = YES;
}

- (void)addDefaultBackItem{
    
    [self setLeftItemImage:@"button_back_11x20_"];

}
- (void)setNavBarTitle:(NSString *)title{
    
    self.titleLabel.text = title;
}
- (void)setLeftItemTitle:(NSString *)title{
    [self.leftItemBtn setTitle:title forState:UIControlStateNormal];
}

- (void)setLeftItemImage:(NSString *)imageName{
    [self.leftItemBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void)setRightItemTitle:(NSString *)title{
    [self.rightItemBtn setTitle:title forState:UIControlStateNormal];

}

- (void)setRightItemImage:(NSString *)imageName{
    [self.rightItemBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

}

- (void)leftItemAction:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)rightItemAction:(id)sender{
    
}


// 是否可右滑返回
//- (void)navigationCanDragBack:(BOOL)bCanDragBack
//{
//    if (self.navigationController)
//    {
//    [((CustomNavigationController *)(self.navigationController)) navigationCanDragBack:bCanDragBack];
//    }
//}
#pragma mark -
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
