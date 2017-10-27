//
//  NXWebViewController.m
//  NXWebViewKit
//
//  Created by kepuna on 2017/10/27.
//  Copyright © 2017年 kepuna. All rights reserved.
//

#import "NXWebViewController.h"
#import "LoadingWebViewFactory.h"
#import "AlertWebViewFactory.h"
#import "ProgressWebViewFactory.h"

@interface NXWebViewController ()

@property (nonatomic, strong) WebView *webView;

@end

@implementation NXWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"http://ncfh5.limingjie.top/index.php?r=view/detail&mid=4412" forKey:WebViewUrl];
    [params setObject:@"关于" forKey:WebViewTopTip];
    [params setObject:@"我知道了" forKey:WebViewBottomTip];
    
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    WebView *webView = [AlertWebViewFactory createWebViewWithFrame:frame params:params.copy];
    [webView addScriptMessageNames:@[@"jumpToUserIndex",@"topicList"]];
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
