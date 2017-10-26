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
NSString * const WebViewInteractionNames = @"WebViewInteractionNames";

@interface WebView ()<WKScriptMessageHandler>

@property (nonatomic, copy) NSArray *interactionNames;

@end

@implementation WebView

- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params {
    if (self = [super initWithFrame:frame]) {
        self.webViewFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.params = params;
        
        if (params[WebViewInteractionNames]) {
           self.interactionNames = params[WebViewInteractionNames];
            for (NSString *name in self.interactionNames) {
                [self.webView.configuration.userContentController addScriptMessageHandler:self name:name];
            }
        }
    }
    return self;
}

- (void)requestWithUrl:(NSString *)url {
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([self.delegate respondsToSelector:@selector(webView:didReceiveScriptMessageBody:)]) {
        [self.delegate webView:self didReceiveScriptMessageBody:message.body];
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
}



@end
