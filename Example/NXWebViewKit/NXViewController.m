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
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"http://ncfh5.limingjie.top/index.php?r=view/detail&mid=4412" forKey:WebViewUrl];
    [params setObject:@"关于" forKey:WebViewTopTip];
    [params setObject:@"我知道了" forKey:WebViewBottomTip];
    [params setObject:@[@"jumpToUserIndex",@"topicList"] forKey:WebViewScriptMessageNames];
    //    [params setValue:[UIColor redColor] forKey:WebViewTopTipViewBackgroundColor];
    //    [params setValue:[UIColor yellowColor] forKey:WebViewBottomBtnBackgroundColor];

    
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    WebView *webView = [AlertWebViewFactory createWebViewWithFrame:frame params:params.copy];
    [self.view addSubview:webView];
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
