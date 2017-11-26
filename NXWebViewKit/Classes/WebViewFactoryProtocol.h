//
//  WebViewFactoryProtocol.h
//  Pods
//
//  Created by kepuna on 2017/10/26.
//
//

#import <Foundation/Foundation.h>
#import "NXWebView.h"

@protocol WebViewFactoryProtocol <NSObject>

+ (NXWebView *)createWebViewWithFrame:(CGRect)frame params:(NSDictionary *)params;

@end
