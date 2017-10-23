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

@implementation WebView

- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params {
    if (self = [super initWithFrame:frame]) {
        self.webViewFrame = frame;
        self.params = params;
    }
    return self;
}

@end
