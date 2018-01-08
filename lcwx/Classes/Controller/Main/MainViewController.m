//
//  MainViewController.m
//  lcwx
//
//  Created by luck on 2018/1/8.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadViewControllers];
}
- (void)loadViewControllers{
    NSArray *vcs = @[@"BookShelfViewController",@"ChoicenessViewController",@"RankViewController",@"AccountViewController"];
    NSArray *taritemtitle = @[@"书架",@"精选",@"榜单",@"账户"];
    NSArray *tabimg = @[@"tabbar_bokcase",@"tab_jinx_24x21_",@"tab_ph_22x21_",@"tab_user_22x22_"];
    NSArray *tabselimg = @[@"tabbar_bokcase_sel",@"tab_jinx_sel_24x21_",@"tab_ph_sel_22x21_",@"tab_user_sel_22x22_"];
    NSMutableArray *viewcontrollers = [NSMutableArray array];
    NSInteger count = 0;
    for (NSString *class_name in vcs) {
        UIViewController *vc = [[NSClassFromString(class_name) alloc]init];
        UITabBarItem *item =[[UITabBarItem alloc]initWithTitle:taritemtitle[count] image:[[UIImage imageNamed:tabimg[count]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:tabselimg[count]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"f0554e"]} forState:UIControlStateSelected];
        vc.tabBarItem = item;
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
        [viewcontrollers addObject:nav];
        count++;
    }
    self.viewControllers = viewcontrollers;
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
