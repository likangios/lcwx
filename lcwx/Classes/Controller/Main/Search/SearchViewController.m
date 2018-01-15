//
//  SearchViewController.m
//  lcwx
//
//  Created by macdev on 2018/1/15.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (nonatomic,strong) UITextField *inputField;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatInputView];
    [self setRightItemTitle:@"取消"];
}
- (void)creatInputView{
    UIImageView *tlfV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    tlfV.image = [UIImage imageNamed:@"navigationbar_search_20x20_"];
    tlfV.contentMode = UIViewContentModeCenter;
    tlfV.backgroundColor = [UIColor whiteColor];
    UITextField *textField = [[UITextField alloc]init];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = tlfV;
    textField.placeholder = @"12345675432";
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.layer.borderColor = lineColor.CGColor;
    textField.layer.borderWidth = 1;
    textField.layer.cornerRadius = 17;
    textField.tintColor = mainColor_red;
    
    [self.customNavBar addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-57);
        make.centerY.equalTo(self.customNavBar).offset(10);
        make.height.mas_equalTo(34);
    }];
}
- (void)rightItemAction:(id)sender{
    [self.inputField resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
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
