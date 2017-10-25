//
//  NXViewController.m
//  NXWebViewKit
//
//  Created by kepuna on 10/23/2017.
//  Copyright (c) 2017 kepuna. All rights reserved.
//

#import "NXViewController.h"
#import "LoadingWebViewFactory.h"
#import "AlertWebViewFactory.h"
#import "ProgressWebViewFactory.h"

@interface NXViewController ()

@property (nonatomic, strong) WebView *webView;

@end

@implementation NXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self.view addSubview:self.webView];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"https://www.baidu.com" forKey:WebViewUrl];
    [params setValue:@"关于" forKey:WebViewTopTip];
    [params setValue:@"我知道了" forKey:WebViewBottomTip];
    [params setValue:[UIColor redColor] forKey:WebViewTopTipViewBackgroundColor];
    [params setValue:[UIColor yellowColor] forKey:WebViewBottomBtnBackgroundColor];
    
    WebView *webView = [ProgressWebViewFactory createWebViewWithFrame:self.view.frame params:params.copy];
    [self.view addSubview:webView];
}

- (WebView *)webView {
    if (_webView == nil) {
        
        NSDictionary *params = @{
                                 WebViewUrl:@"https://www.baidu.com",
                                 WebViewTopTip:@"关于",
                                 WebViewBottomTip:@"我知道了",
//                                 WebViewBottomBtnBackgroundColor:[UIColor redColor],
//                                 WebViewTopTipViewBackgroundColor:[UIColor yellowColor]
                                 };
        
        _webView = [LoadingWebViewFactory createWebViewWithFrame:self.view.frame params:params];
    }
    return _webView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
