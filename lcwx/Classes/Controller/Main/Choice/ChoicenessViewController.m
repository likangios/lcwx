//
//  ChoicenessViewController.m
//  lcwx
//
//  Created by luck on 2018/1/8.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "ChoicenessViewController.h"
#import "LCActionRecommend.h"
@interface ChoicenessViewController ()

@property(nonatomic,strong) UITableView *tableView;


@end

@implementation ChoicenessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
    }
    return _tableView;
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
