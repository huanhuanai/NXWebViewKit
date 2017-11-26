//
//  LoadingWebViewFactory.m
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import "LoadingWebViewFactory.h"
#import "LoadingWebView.h"

@implementation LoadingWebViewFactory

+ (NXWebView *)createWebViewWithFrame:(CGRect)frame params:(NSDictionary *)params {
     return [[LoadingWebView alloc] initWithFrame:frame params:params];
}

@end
