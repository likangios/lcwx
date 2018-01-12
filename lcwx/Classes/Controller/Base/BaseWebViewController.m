//
//  BaseWebViewController.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "BaseWebViewController.h"
#import <WebKit/WebKit.h>
#import <WKWebViewJavascriptBridge.h>
#import <WebViewJavascriptBridge.h>
@interface BaseWebViewController ()

@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) WKWebView *wkWebView;
@property (nonatomic,strong) WKWebViewJavascriptBridge *bridge;

@end

@implementation BaseWebViewController

- (instancetype)initWithUrl:(NSString *)url{
    self = [super init];
    self.hidesBottomBarWhenPushed =YES;
    if (self) {
        self.url = url;
    }
    return self;
}
- (WKWebView *)wkWebView{
    if (!_wkWebView) {
        _wkWebView = [[WKWebView alloc]init];
    }
    return _wkWebView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDefaultBackItem];
    [self.view addSubview:self.wkWebView];
    [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(self.customNavBar.mas_bottom);
    }];
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    self.bridge = [WKWebViewJavascriptBridge bridgeForWebView:self.wkWebView];
    [self.bridge registerHandler:@"back" handler:^(id data, WVJBResponseCallback responseCallback) {
        [self leftItemAction:nil];
        responseCallback(data);
    }];
    [self.bridge registerHandler:@"open" handler:^(id data, WVJBResponseCallback responseCallback) {
        responseCallback(data);
    }];
    
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
