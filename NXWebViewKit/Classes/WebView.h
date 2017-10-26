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

@interface WebView : UIView <WKNavigationDelegate>

@property (nonatomic, strong, readonly) WKWebView *webView;
@property (nonatomic, assign, readonly) CGRect webViewFrame;
@property (nonatomic, strong, readonly) NSURLRequest *urlRequest;
@property (nonatomic, weak) id<WebViewDelegate> delegate;


/**
 webView初始化方法

 @param frame frame
 @param params 传入所需参数
 @return webview实例
 */
- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params;

/**
 添加js交互的names数组
 */
- (void)addScriptMessageNames:(NSArray *)names;

/**
 重新加载
 */
- (void)reload;

@end

@protocol WebViewDelegate <NSObject>


/**
 JS交互的代理方法

 @param webView webView
 @param body js交互返回的数据
 @param name js交互的name
 */
- (void)webView:(WebView *)webView didReceiveScriptMessageBody:(id)body scriptMessageName:(NSString *)name;

@end
