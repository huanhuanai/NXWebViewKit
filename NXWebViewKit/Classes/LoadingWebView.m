//
//  LoadingWebView.m
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import "LoadingWebView.h"
#import <WebKit/WebKit.h>
#import "MBProgressHUD.h"

@interface LoadingWebView ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation LoadingWebView

- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params {
    if (self = [super initWithFrame:frame params:params]) {
        [self addSubview:self.webView];
        
        if (params[WebViewUrl]) {
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:params[WebViewUrl]]];
            [self.webView loadRequest:request];
        }
    }
    return self;
}

- (WKWebView *)webView {
    if (_webView == nil) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        _webView = [[WKWebView alloc] initWithFrame:self.webViewFrame configuration:config];
        _webView.opaque = NO;
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.navigationDelegate = self;
    }
    return _webView;
}

#pragma mark - navigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"%s 开始加载",__func__);
    [MBProgressHUD showHUDAddedTo:self animated:YES];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"%s 加载完成",__func__);
    [MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"%s 加载失败",__func__);
    [MBProgressHUD hideHUDForView:self animated:YES];
}

@end
