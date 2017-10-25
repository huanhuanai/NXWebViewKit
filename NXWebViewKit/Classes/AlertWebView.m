//
//  AlertWebView.m
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import "AlertWebView.h"
#import <WebKit/WebKit.h>
#import "UIView+NXAdd.h"
#import "UIImage+NXAdd.h"
#import <MBProgressHUD/MBProgressHUD.h>

#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kLineColor RGB(229,229,229)
#define kTipViewBackgrondColor RGB(248,248,248)
#define kTipViewTextColor RGB(51,51,51)
#define kBottomBtnColor RGB(0,191,143)

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScale  ScreenWidth/375.0

CGFloat const NXAlertWebViewLineHeight = 0.5;
CGFloat const NXAlertWebViewTopViewHeight = 45;
CGFloat const NXAlertWebViewLeftMargin = 15;

@interface AlertWebView ()

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *topTipView;
@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, copy) NSString *topTip;
@property (nonatomic, copy) NSString *bottomTip;
@property (nonatomic, strong) UIColor *tipViewBackgrondColor;
@property (nonatomic, strong) UIColor *bottomBtnColor;

@end

@implementation AlertWebView

- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params {
    if (self = [super initWithFrame:frame params:params]) {
    
        self.backgroundColor = [UIColor colorWithRed:(0)/255.0 green:(0)/255.0 blue:(0)/255.0 alpha:0.6];
        self.tipViewBackgrondColor = params[WebViewTopTipViewBackgroundColor] ? params[WebViewTopTipViewBackgroundColor] : kTipViewBackgrondColor;
        self.bottomBtnColor = params[WebViewBottomBtnBackgroundColor] ? params[WebViewBottomBtnBackgroundColor] : kBottomBtnColor;
        self.topTip = params[WebViewTopTip];
        self.bottomTip = params[WebViewBottomTip];
    
        [self addSubview:self.backView];
        [self.backView addSubview:self.topTipView];
        [self.topTipView addSubview:self.tipLabel];
        [self.topTipView addSubview:self.closeBtn];
        [self.topTipView addSubview:self.topLineView];
        [self.backView addSubview:self.bottomBtn];
        [self.backView addSubview:self.webView];
        [self.backView addSubview:self.bottomLineView];
        

        if (params[WebViewUrl]) {
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:params[WebViewUrl]]];
            [self.webView loadRequest:request];
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(s_remove)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)s_remove {
    [self removeFromSuperview];
}

#pragma mark - navigationDelegate
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    [webView reload];
}

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


#pragma mark - getters
- (UIView *)backView {
    if (_backView == nil) {
        _backView = [[UIView alloc]init];
        _backView.center = self.center;
        _backView.bounds = CGRectMake(0, 0, self.width - NXAlertWebViewLeftMargin * 2 * kScale, self.height - 120 * kScale);
        _backView.layer.cornerRadius = 5.0;
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

- (UIView *)topTipView {
    if (_topTipView == nil) {
        CGRect frame = CGRectMake(0, 0, self.width - NXAlertWebViewLeftMargin * 2 * kScale, NXAlertWebViewTopViewHeight * kScale);
        _topTipView = [[UIView alloc] initWithFrame:frame];
        _topTipView.backgroundColor = [UIColor whiteColor];
        [_topTipView setCorner:UIRectCornerTopLeft | UIRectCornerTopRight cornerSize:CGSizeMake(5 * kScale, 5 * kScale)];
    }
    return _topTipView;
}

- (UILabel *)tipLabel {
    if (_tipLabel == nil) {
        CGRect frame = CGRectMake(0, 0, self.topTipView.width, self.topTipView.height);
        _tipLabel = [[UILabel alloc]initWithFrame:frame];
        _tipLabel.backgroundColor = self.tipViewBackgrondColor;
        _tipLabel.textColor = kTipViewTextColor;
        _tipLabel.font = [UIFont systemFontOfSize:18 * kScale];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.text = self.topTip;
    }
    return _tipLabel;
}

- (UIButton *)closeBtn {
    if (_closeBtn == nil) {
        CGFloat width = 40 * kScale;
        CGRect frame = CGRectMake(self.topTipView.width - width, 0, width, self.topTipView.height);
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *img = [UIImage ff_imagePathWithName:@"btn_close" bundle:@"NXWebViewKit" targetClass:[self class]];
        [_closeBtn setImage:img forState:UIControlStateNormal];
        _closeBtn.frame = frame;
        _closeBtn.backgroundColor = [UIColor clearColor];
        [_closeBtn addTarget:self action:@selector(s_remove) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (UIView *)topLineView {
    if (_topLineView == nil) {
        CGRect frame = CGRectMake(0, self.topTipView.height - NXAlertWebViewLineHeight * kScale, self.topTipView.width, NXAlertWebViewLineHeight * kScale);
        _topLineView = [[UIView alloc] initWithFrame:frame];
        _topLineView.backgroundColor = kLineColor;
    }
    return _topLineView;
}

- (UIButton *)bottomBtn {
    if (_bottomBtn == nil) {
        
        CGRect frame = CGRectMake(0, self.backView.height - 45 * kScale, self.backView.width, 45 * kScale);
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomBtn.frame = frame;
        [_bottomBtn setTitle:self.bottomTip forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _bottomBtn.titleLabel.font = [UIFont systemFontOfSize:16.0 * kScale];
        _bottomBtn.backgroundColor = self.bottomBtnColor;
        [_bottomBtn setCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerSize:CGSizeMake(5 * kScale, 5 * kScale)];
        [_bottomBtn addTarget:self action:@selector(s_remove) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBtn;
}

- (UIView *)bottomLineView {
    if (_bottomLineView == nil) {
        CGRect frame = CGRectMake(0,self.backView.height - 45 * kScale, self.backView.width, 0.5 * kScale);
        _bottomLineView = [[UIView alloc] initWithFrame:frame];
        _bottomLineView.backgroundColor = kLineColor;
    }
    return _bottomLineView;
}

- (WKWebView *)webView {
    if (_webView == nil) {
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, self.topTipView.height, self.backView.width, self.backView.height - self.topTipView.height - self.bottomBtn.height - self.bottomLineView.height)];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.navigationDelegate = self;
    }
    return _webView;
}

@end
