//
//  ProgressWebView.m
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import "ProgressWebView.h"
#import "UIView+NXAdd.h"

@interface ProgressWebView ()<WKNavigationDelegate>

@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation ProgressWebView

- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params {
    if (self = [super initWithFrame:frame params:params]) {
        
        [self addSubview:self.webView];
        [self addSubview:self.progressView];
        [self addScriptMessageNames];
        
        if (params[WebViewUrl]) {
            [self requestWithUrl:params[WebViewUrl]];
        }
        [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

#pragma mark - handle event
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

#pragma mark - navigationDelegate
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    [webView reload];
}

#pragma mark - getters
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
}

@end
