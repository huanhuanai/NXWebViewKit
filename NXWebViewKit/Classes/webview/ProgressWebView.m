//
//  ProgressWebView.m
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import "ProgressWebView.h"
#import <WebKit/WebKit.h>

#import "UIView+NXAdd.h"

@interface ProgressWebView ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation ProgressWebView

- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params {
    if (self = [super initWithFrame:frame params:params]) {
        
        [self addSubview:self.webView];
        [self addSubview:self.progressView];
    
        if (params[WebViewUrl]) {
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:params[WebViewUrl]]];
            [self.webView loadRequest:request];
        }

    }
    return self;
}

#pragma mark - WKWebView代理
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    [webView reload];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.webView.estimatedProgress;
        if (self.progressView.progress == 1) {
            
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.1f);
            } completion:^(BOOL finished) {
                self.progressView.hidden = YES;
                
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


- (WKWebView *)webView {
    if (_webView == nil) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        _webView = [[WKWebView alloc] initWithFrame:self.webViewFrame configuration:config];
        _webView.opaque = NO;
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.navigationDelegate = self;
        [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _webView;
}

- (UIProgressView *)progressView {
    if (_progressView == nil) {
        CGRect frame = CGRectMake(0, 0, self.width, 1.5);
        _progressView = [[UIProgressView alloc] initWithFrame:frame];
        _progressView.tintColor = [UIColor greenColor];
        _progressView.trackTintColor = [UIColor whiteColor];
        _progressView.transform = CGAffineTransformMakeScale(1.0f, 1.2f);
    }
    return _progressView;
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView setNavigationDelegate:nil];
}

@end
