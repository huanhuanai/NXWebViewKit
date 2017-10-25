//
//  WebView.h
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import <UIKit/UIKit.h>

FOUNDATION_EXTERN NSString * const WebViewUrl;
FOUNDATION_EXTERN NSString * const WebViewTopTip;
FOUNDATION_EXTERN NSString * const WebViewBottomTip;
FOUNDATION_EXTERN NSString * const WebViewTopTip;
FOUNDATION_EXTERN NSString * const WebViewTopTipViewBackgroundColor;
FOUNDATION_EXTERN NSString * const WebViewBottomBtnBackgroundColor;


@interface WebView : UIView

@property (nonatomic, assign) CGRect webViewFrame;
@property (nonatomic, copy) NSDictionary *params;

- (instancetype)initWithFrame:(CGRect)frame params:(NSDictionary *)params;

@end
