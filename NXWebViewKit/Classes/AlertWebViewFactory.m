//
//  AlertWebViewFactory.m
//  Pods
//
//  Created by kepuna on 2017/10/23.
//
//

#import "AlertWebViewFactory.h"
#import "AlertWebView.h"

@implementation AlertWebViewFactory

+ (NXWebView *)createWebViewWithFrame:(CGRect)frame params:(NSDictionary *)params {
     return [[AlertWebView alloc] initWithFrame:frame params:params];
}

@end
