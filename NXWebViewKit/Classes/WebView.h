//
//  WebView.h
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@protocol WebViewDelegate;

FOUNDATION_EXTERN NSString * const WebViewUrl;
FOUNDATION_EXTERN NSString * const WebViewTopTip;
FOUNDATION_EXTERN NSString * const WebViewBottomTip;
FOUNDATION_EXTERN NSString * const WebViewTopTip;
FOUNDATION_EXTERN NSString * const WebViewTopTipViewBackgroundColor;
FOUNDATION_EXTERN NSString * const WebViewBottomBtnBackgroundColor;
FOUNDATION_EXTERN NSString * const WebViewInteractionNames; //JS交互的Key（传入数组）

@interface WebView : UIView <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, assign) CGRect webViewFrame;
@property (nonatomic, copy) NSDictionary *params;
@property (nonatomic, weak) id<WebViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params;
- (void)requestWithUrl:(NSString *)url;

@end

@protocol WebViewDelegate <NSObject>

- (void)webView:(WebView *)webView didReceiveScriptMessageBody:(id)body;

@end
