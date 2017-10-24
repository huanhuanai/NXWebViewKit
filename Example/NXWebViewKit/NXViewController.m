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
    
    [self.view addSubview:self.webView];
}

- (WebView *)webView {
    if (_webView == nil) {
        
        NSDictionary *params = @{
                                 WebViewUrl:@"https://www.baidu.com",
                                 WebViewTopTip:@"关于",
                                 WebViewBottomTip:@"我知道了",
                                 WebViewBottomBtnBackgroundColor:[UIColor redColor],
                                 WebViewTopTipViewBackgroundColor:[UIColor yellowColor]
                                 };
        
        _webView = [AlertWebViewFactory createWebViewWithFrame:self.view.frame params:params];
    }
    return _webView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
