//
//  WebViewFactory.h
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import <Foundation/Foundation.h>
#import "WebView.h"

@interface WebViewFactory : NSObject

+ (WebView *)createWebViewWithFrame:(CGRect)frame params:(NSDictionary *)params;

@end
