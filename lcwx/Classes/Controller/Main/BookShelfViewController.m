//
//  BookShelfViewController.m
//  lcwx
//
//  Created by luck on 2018/1/8.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "BookShelfViewController.h"
#import "LCActionCheckAppVersion.h"
@interface BookShelfViewController ()

@end

@implementation BookShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LCActionCheckAppVersion *action =[[LCActionCheckAppVersion alloc]init];
    [action DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
        
    } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
        
    }];
    // Do any additional setup after loading the view.
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
