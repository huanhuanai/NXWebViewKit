//
//  ProgressWebViewFactory.m
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import "ProgressWebViewFactory.h"
#import "ProgressWebView.h"

@implementation ProgressWebViewFactory

+ (WebView *)createWebViewWithFrame:(CGRect)frame params:(NSDictionary *)params {
    return [[ProgressWebView alloc] initWithFrame:frame params:params];
}

@end
