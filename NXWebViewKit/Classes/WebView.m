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
NSString * const WebViewScriptMessageNames = @"WebViewScriptMessageNames";

@interface WebView ()<WKScriptMessageHandler>

@property (nonatomic, copy) NSArray *scriptMessageNames;

@end

@implementation WebView

#pragma  init config 
- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params {
    if (self = [super initWithFrame:frame]) {
        self.webViewFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.params = params;
        
        if (params[WebViewScriptMessageNames]) {
           self.scriptMessageNames = params[WebViewScriptMessageNames];
           [self p_addScriptMessageNames];
        }
    }
    return self;
}

#pragma mark - handle event
- (void)requestWithUrl:(NSString *)url {
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([self.delegate respondsToSelector:@selector(webView:didReceiveScriptMessageBody: scriptMessageName:)]) {
        [self.delegate webView:self didReceiveScriptMessageBody:message.body scriptMessageName:message.name];
    }
}

#pragma mark - privete method
- (void)p_addScriptMessageNames{
    
    for (NSString *name in self.scriptMessageNames) {
        [self.webView.configuration.userContentController addScriptMessageHandler:self name:name];
    }
}

- (void)p_removeScriptMessageNames{
    
    for (NSString *name in self.scriptMessageNames) {
        [self.webView.configuration.userContentController removeScriptMessageHandlerForName:name];
    }
    
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
    [self.webView setNavigationDelegate:nil];
    [self p_removeScriptMessageNames];
}



@end
