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

@implementation WebView

- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params {
    if (self = [super initWithFrame:frame]) {
        self.webViewFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.params = params;
    }
    return self;
}

@end
