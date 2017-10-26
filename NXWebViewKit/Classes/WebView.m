//
//  WebView.m
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import "WebView.h"

NSString * const WebViewUrl = @"WebViewUrl";
NSString * const WebViewTopTip = @"WebViewTopTip";
NSString * const WebViewBottomTip = @"WebViewBottomTip";
NSString * const WebViewTopTipViewBackgroundColor = @"WebViewTopTipViewBackgroundColor";
NSString * const WebViewBottomBtnBackgroundColor = @"WebViewBottomBtnBackgroundColor";

@interface WebView ()<WKScriptMessageHandler>

@property (nonatomic, copy) NSArray *scriptMessageNames;
@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, assign, readwrite) CGRect webViewFrame;
@property (nonatomic, strong, readwrite) NSURLRequest *urlRequest;

@end

@implementation WebView

#pragma  init config 
- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params {
    if (self = [super initWithFrame:frame]) {
        self.webViewFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        ;
        self.urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:params[WebViewUrl]]];
    }
    return self;
}

#pragma mark - handle event
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([self.delegate respondsToSelector:@selector(webView:didReceiveScriptMessageBody: scriptMessageName:)]) {
        [self.delegate webView:self didReceiveScriptMessageBody:message.body scriptMessageName:message.name];
    }
}

- (void)addScriptMessageNames:(NSArray *)names {
    self.scriptMessageNames = names;
    if (names) {
        for (NSString *name in names) {
            [self.webView.configuration.userContentController addScriptMessageHandler:self name:name];
        }
    }
}

- (void)removeScriptMessageNames {
    if (self.scriptMessageNames) {
        for (NSString *name in self.scriptMessageNames) {
            [self.webView.configuration.userContentController removeScriptMessageHandlerForName:name];
        }
    }
}

- (void)reload {
    [self.webView reload];
}

#pragma mark - getters
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

- (void)dealloc {
    NSLog(@"#### %s 销毁 ####",__func__);
    [self.webView setNavigationDelegate:nil];
    [self removeScriptMessageNames];
}



@end
