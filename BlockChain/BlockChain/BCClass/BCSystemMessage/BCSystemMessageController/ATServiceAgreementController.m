//
//  ATServiceAgreementController.m
//  Auction
//
//  Created by 蔡路飞 on 2017/10/27.
//  Copyright © 2017年 Cailufei. All rights reserved.
//

#import "ATServiceAgreementController.h"
#import <WebKit/WebKit.h>
@interface ATServiceAgreementController ()<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation ATServiceAgreementController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.htmltitle;
     self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, kTabBarHeight, LFscreenW, LFscreenH  - kTabBarHeight)];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.htmlurl]]];
    [self.view addSubview:self.webView];
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
      [MBManager showWaitingWithTitle:@"请稍后.."];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"btn_back_titlebar" selectImage:@"btn_back_titlebar" target:self action:@selector(goBackAction)];
//    if ([self.htmlurl isEqualToString:HELP_SERVER]) {
//        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"关闭" color:blackTextColor highlightColor:blackTextColor target:self action:@selector(backAction)];
//    }
    
}
-(void)backAction{
  [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)goBackAction{
    if (self.webView.canGoBack==YES) {
        [self.webView goBack];
        [MBManager showWaitingWithTitle:@"请稍后.."];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
    
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
     [MBManager hideAlert];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
    
}


@end
