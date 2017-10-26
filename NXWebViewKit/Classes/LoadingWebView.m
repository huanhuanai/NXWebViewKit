//
//  LoadingWebView.m
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import "LoadingWebView.h"
#import "MBProgressHUD.h"


@implementation LoadingWebView

- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params {
    if (self = [super initWithFrame:frame params:params]) {
        
        [self addSubview:self.webView];
        if (params[WebViewUrl]) {
            [self requestWithUrl:params[WebViewUrl]];
        }
    }
    return self;
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
